#!../../bin/rhel6-x86_64/oscilloscope

#- Support for general purpose oscilloscopes

< envPaths

epicsEnvSet("IOC_NAME", "SIOC:SYS1:SC01")

< ../common/generalInit.cmd
pwd()

#epicsEnvSet("NODE_NAME", "scop-la20-ls21")
#epicsEnvSet("P", "SCOP:LA20:LS21")
#< iocBoot/common/tds.cmd

#epicsEnvSet("NODE_NAME", "scop-li20-ex01")
#epicsEnvSet("P", "SCOP:LI20:EX01")
#< iocBoot/common/tds.cmd

#epicsEnvSet("NODE_NAME", "scop-li20-ex02")
#epicsEnvSet("P", "SCOP:LI20:EX02")
#< iocBoot/common/tds.cmd

#epicsEnvSet("NODE_NAME", "scop-li20-los1")
#epicsEnvSet("P", "SCOP:LI20:LOS1")
#< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-in10-fc01")
epicsEnvSet("P", "SCOP:IN10:FC01")
< iocBoot/common/tds.cmd

epicsEnvSet("NODE_NAME", "scop-mcc0-sc02")
epicsEnvSet("P", "SCOP:MCC0:SC02")
< iocBoot/common/tds.cmd

iocInit

< iocBoot/common/autoSaveRun.cmd
