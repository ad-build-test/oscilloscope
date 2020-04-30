#!../../bin/rhel6-x86_64/oscilloscope

#- Support for general purpose oscilloscopes

< envPaths

epicsEnvSet("IOC_NAME", "SIOC:SYS0:SC01")

< ../common/generalInit.cmd
pwd()

epicsEnvSet("NODE_NAME", "scop-li10-nw01")
epicsEnvSet("P", "SCOP:LI10:NW01")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-lr20-ls01")
epicsEnvSet("P", "SCOP:LR20:LS01")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-lr20-ls02")
epicsEnvSet("P", "SCOP:LR20:LS02")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-mcc0-sc01")
epicsEnvSet("P", "SCOP:MCC0:SC01")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-mcc0-sc02")
epicsEnvSet("P", "SCOP:MCC0:SC02")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-mcc0-sc03")
epicsEnvSet("P", "SCOP:MCC0:SC03")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-und1-blf1")
epicsEnvSet("P", "SCOP:UND1:BLF1")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-und1-sc01")
epicsEnvSet("P", "SCOP:UND1:SC01")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-und1-sc02")
epicsEnvSet("P", "SCOP:UND1:SC02")
< iocBoot/common/tds.cmd

iocInit

< iocBoot/common/autoSaveRun.cmd
