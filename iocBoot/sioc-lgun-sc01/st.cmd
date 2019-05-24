#!../../bin/rhel6-x86_64/oscilloscope

#- You may have to change oscilloscope to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("IOC_NAME", "SIOC:LGUN:LS02")
epicsEnvSet("NODE_NAME", "scop-lgun-ls02")
epicsEnvSet("P", "SCOP:LGUN:LS02")

< ../common/generalInit.cmd
pwd()
< iocBoot/common/tds.cmd

iocInit

## Start any sequence programs
#seq sncxxx,"user=gwbrown"

< iocBoot/common/autoSaveRun.cmd
