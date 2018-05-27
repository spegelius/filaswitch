# This script performs a GET and a POST request through HTTP/HTTPS using
# builtin python3 moudules. There is also a class to encode files for upload!
# Code partly copied from: http://www.matteomattei.com/http-https-get-and-post-requests-with-python-including-file-upload/

import urllib.request
import urllib.error
import http.client
import json
import mimetypes
import codecs
import uuid
import binascii
import io
import os
import sys

import utils
from logger import Logger
from settings import Settings


class MultipartFormdataEncoder(object):
    """
    Multi part form data encoder. Copied with small modifications from internet, cannot find the original page anymore.
    Anyhoo, credits to the original author
    """
    def __init__(self):
        self.boundary = uuid.uuid4().hex
        self.content_type = 'multipart/form-data; boundary={}'.format(self.boundary)

    @classmethod
    def u(cls, s):
        if sys.hexversion < 0x03000000 and isinstance(s, str):
            s = s.decode('utf-8')
        if sys.hexversion >= 0x03000000 and isinstance(s, bytes):
            s = s.decode('utf-8')
        return s

    def iter(self, fields, files):
        """
        fields is a sequence of (name, value) elements for regular form fields.
        files is a sequence of (name, filename, file-type) elements for data to be uploaded as files
        Yield body's chunk as bytes
        """
        encoder = codecs.getencoder('utf-8')
        for (key, value) in fields.items():
            key = self.u(key)
            yield encoder('--{}\r\n'.format(self.boundary))
            yield encoder(self.u('Content-Disposition: form-data; name="{}"\r\n').format(key))
            yield encoder('\r\n')
            if isinstance(value, int) or isinstance(value, float):
                value = str(value)
            yield encoder(self.u(value))
            yield encoder('\r\n')
        for (key, filename, fpath) in files:
            key = self.u(key)
            filename = self.u(filename)
            yield encoder('--{}\r\n'.format(self.boundary))
            yield encoder(self.u('Content-Disposition: form-data; name="{}"; filename="{}"\r\n').format(key, filename))
            yield encoder('Content-Type: {}\r\n'.format(mimetypes.guess_type(filename)[0] or 'application/octet-stream'))
            yield encoder('\r\n')
            with open(fpath,'rb') as fd:
                buff = fd.read()
                yield (buff, len(buff))
            yield encoder('\r\n')
        yield encoder('--{}--\r\n'.format(self.boundary))

    def encode(self, fields, files):
        body = io.BytesIO()
        for chunk, chunk_len in self.iter(fields, files):
            body.write(chunk)
        return self.content_type, body.getvalue()


class OctoPrint(object):
    """
    Octoprint handler class. Used for uploading gcode files to OctoPrint
    and starting prints
    """

    USERAGENT = 'FilaSwitch'

    def __init__(self, url: str, api_key: str, logger: Logger):

        self.protocol = utils.http_or_https(url)
        self.url = url.split("://")[-1]
        self.logger = logger
        self.headers = {"X-Api-Key": api_key,
                        'User-Agent': self.USERAGENT}
        self.logger.debug("OctoPrint url {}".format(self.url))

    def _post(self, url_path, fields, files, multipart=True):
        """
        Post form data and file to given url path (base url defined in class)
        :param url_path: url path
        :param fields: form data fields
        :param files: list of files to post
        :return:
        """

        _files = []
        for f in files:
            _files.append(('file',os.path.basename(f), f))

        if multipart:
            content_type, body = MultipartFormdataEncoder().encode(fields, _files)
        else:
            content_type = "application/json"
            body = json.dumps(fields)

        if self.protocol == 'http':
            h = http.client.HTTPConnection(self.url)
        else:
            h = http.client.HTTPSConnection(self.url)

        _headers = {
            'Content-Type': content_type
        }
        _headers.update(self.headers)

        h.request('POST', url_path, body, _headers)
        res = h.getresponse()
        response = res.read().decode('utf-8')
        if not res.status in (200,201):
            self.logger.error(response)
            raise IOError("Http error {}".format(res.status))
        self.logger.debug("POST RESPONSE")
        self.logger.debug(response)
        return response

    def _get(self, path):
        """
        GET request to given url path
        :param path:
        :return:
        """
        req = urllib.request.Request(self.protocol + '://' + self.url + "/api/files/{}".format(path),
                                     headers=self.headers)

        with urllib.request.urlopen(req, timeout=30) as f:
            buf = f.read().decode('utf-8')
            self.logger.debug("GET RESPONSE")
            self.logger.debug(buf)
            return buf

    def _build_path(self, location, target_path, filename):
        """
        Builds gcode file full path
        :param location: local or sdcard
        :param target_path: target folder
        :param filename: gcode filename
        :return:
        """
        url_path = '/api/files/' + location
        if target_path:
            url_path += "/" + target_path
        url_path += "/" + filename
        return url_path

    def _create_folder(self, target_path, location):
        """
        Create folder to OctoPrint
        :param target_path: folder path
        :param location: local or sdcard
        :return:
        """
        foldername = os.path.split(target_path)[-1]
        path = "/".join(os.path.split(target_path)[:-1]) + "/"
        # create directory
        fields = {'foldername': foldername, 'path': path}
        self._post('/api/files/{}'.format(location), fields, {})


    def upload_file(self, filepath, target_path, location="local"):
        """
        Upload file to OctoPrint
        :param filepath: path to the file to upload
        :param target_path: folder to upload to
        :param location: local or sdcard
        :return: uploaded file url path
        """
        try:
            # check if path exists
            if target_path:
                self._get(location + "/" + target_path)
        except urllib.error.HTTPError as e:
            if e.code != 404:
                self.logger.error("HTTP Error {}, Octoprint folder check failed".format(e))
                return
            else:
                try:
                    self._create_folder(target_path, location)
                except Exception as e:
                    self.logger.error("HTTP Error {}, Octoprint folder creation failed".format(e))
                    return
        try:
            fields = {"path": target_path}
            self._post('/api/files/{}'.format(location), fields, [filepath])
            return self._build_path(location, target_path, os.path.basename(filepath))

        except Exception as e:
            self.logger.error("HTTP Error {}, Octoprint upload failed".format(e))

    def start_print(self, octo_path):
        """
        Start print in OctoPrint
        :param octo_path: OctoPrint file path
        :return:
        """
        try:
            fields = {"command": "select", "print": True}
            self._post(octo_path, fields, [], multipart=False)
        except Exception as e:
            pass


if __name__ == "__main__":

    d = "FStesting"
    l = Logger(".", debug=True)
    o = OctoPrint("octoprusa", "7EEE3F41EB654DB48BF4E5A51A734EAE", l)
    o.upload_file("/media/Roinaa/3DModels/_work/Prusa/Fridge/Hinge_fix_v2.gcode", "test1/test3")