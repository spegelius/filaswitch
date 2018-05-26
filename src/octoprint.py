# This script performs a GET and a POST request through HTTP/HTTPS using
# builtin python3 moudules. There is also a class to encode files for upload!
# Code partly copied from: http://www.matteomattei.com/http-https-get-and-post-requests-with-python-including-file-upload/

import urllib.request
import urllib.error
import http.client
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
            print(key)
            filename = self.u(filename)
            print(filename)
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

    USERAGENT = 'FilaSwitch'

    def __init__(self, url: str, api_key: str, logger: Logger):

        self.url = url
        self.logger = logger
        self.headers = {"X-Api-Key": api_key,
                        'User-Agent': self.USERAGENT}
        self.protocol = utils.http_or_https(self.url)

    def _post(self, location, fields, files):
        # POST FIELDS AND FILES

        _files = []
        for f in files:
            _files.append(('file',os.path.basename(f), f))

        content_type, body = MultipartFormdataEncoder().encode(fields, _files)
        #print(body)
        if self.protocol == 'http':
            h = http.client.HTTPConnection(self.url)
        else:
            h = http.client.HTTPSConnection(self.url)
        _headers = {
            'Content-Type': content_type
        }
        _headers.update(self.headers)
        h.request('POST', '/api/files/{}'.format(location), body, _headers)
        res = h.getresponse()
        response = res.read().decode('utf-8')
        if not res.status in (200,201):
            self.logger.error(response)
            raise IOError("Http error {}".format(res.status))
        self.logger.debug("POST RESPONSE")
        self.logger.debug(response)
        return response

    def _get(self, path):

        req = urllib.request.Request(self.protocol + '://' + self.url + "/api/files/{}".format(path),
                                     headers=self.headers)

        with urllib.request.urlopen(req, timeout=30) as f:
            buf = f.read().decode('utf-8')
            self.logger.debug("GET RESPONSE")
            self.logger.debug(buf)
            return buf

    def _create_directory(self, target_path, location):

        try:
            foldername = os.path.split(target_path)[-1]
            path = "/".join(os.path.split(target_path)[:-1]) + "/"
            print(path)
            # create directory
            fields = {'foldername': foldername, 'path': path}
            self._post(location, fields, {})
        except Exception as e:
            self.logger.error("HTTP Error {}, Octoprint folder creation failed".format(e))

    def upload_file(self, filepath, target_path, location="local"):

        try:
            # check if path exists
            self._get(location + "/" + target_path)
        except urllib.error.HTTPError as e:
            if e.code != 404:
                self.logger.error("HTTP Error {}, Octoprint folder check failed".format(e))
                return
            else:
                self._create_directory(target_path, location)

        try:
            fields = {"path": target_path}
            self._post(location, fields, [filepath])
        except Exception as e:
            self.logger.error("HTTP Error {}, Octoprint upload failed".format(e))


if __name__ == "__main__":

    d = "FStesting"
    l = Logger(".", debug=True)
    o = OctoPrint("octoprusa", "7EEE3F41EB654DB48BF4E5A51A734EAE", l)
    o.upload_file("/media/Roinaa/3DModels/_work/Prusa/Fridge/Hinge_fix_v2.gcode", "test1/test2")