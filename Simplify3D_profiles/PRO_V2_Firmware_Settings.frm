setExtruderTempGcode,M104 S$ T#
stabilizeExtruderTempGcode,M109 S$ T#
setBedTempGcode,M140 S$
stabilizeBedTempGcode,M190 S$
reportTempGcode,M105
fanPowerGcode,M106 S$
fanOffGcode,M106 S0
movementOverrideGcode,M220 S$
extrusionOverrideGcode,M221 S$
laserOnGcode,M600 S255
laserOffGcode,M601
syncLaserGcode,M400
initializeSD,M21
listSDfiles,M20
selectSDfile,M23 $
startSDprint,M24
pauseSDprint,M25
reportSDstatus,M27
homeAxisGcode,G28
toolchangeGcode,T$
emergencyStopGcode,M112
enableMotorsGcode,M17
disableMotorsGcode,M18
waitForStartupCommand,1
startupCommand,start
serialAcknowledge,ok
commentChar,;
dwellGcode,G4 P$
macro1name,PURGE-RETRACT
macro1,G91 ; relative positioning,G1 E18 F540 ; 9mm/s purge,G1 E-20 F3000 ; 50mm/s retract,G4 P2500 ; 2.5s cooling period,G1 E-140 F3000 ; 50mm/s long retract
macro2name,FEED
macro2,G91 ; relative positioning,G1 E100 F3000 ; 50mm/s feed,G1 E50 F1500 ; 25mm/s feed,G1 E5 F300 ; 5mm/s feed
macro3name,Macro 3
macro3,
allowCommandBuffering,1
serialCacheSize,63
includeLineNumbersAndChecksums,0
flowControlMethod,0
useCommunicationTimeout,1
timeoutMilliseconds,30000
GPXconfig,r2
XstepsPerMM,88.573186
YstepsPerMM,88.573186
ZstepsPerMM,400.000000
AstepsPerMM,96.2752018703
BstepsPerMM,96.2752018703
AaxisHasHBP,0
BaxisHasHBP,0
