#!../../bin/rhel6-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the Laser GunB Scope
#
#  Name: st.cmd
#
#  Desc:  This is the EPICS startup script for a soft IOC
#         that will control the vacuum system in
#         the FACET-II injector, which is located at
#         sector 10. This IOC will be using the
#         facet facility computer control infrastructure.
#
#  Facility:  LCLS Oscilliscope Controls
#
#  Auth: 29-Apr-2020, Garth Brown     (GBROWN):
#  Rev:  dd-mmm-yyyy, Reviewer's Name (USERNAME)
#--------------------------------------------------------------
#  Mod:
#        08-Apr-2020, K. Luchini      (LUCHINI):
#         add standard header
#         chg db loaded
#         decommission scop-und1-sc01, sioc-und1-sc02
#         and sioc-und1-blf1
#
#==============================================================
#
# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:SYS0:SC01")
epicsEnvSet("LOCATION"  ,"lcls-daemon1")
epicsEnvSet("ENGINEER"  ,"Garth Brown")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
epicsEnvSet("NODE_NAME" ,"scop-li10-nw01")
< iocBoot/common/init_asyn.cmd
epicsEnvSet("NODE_NAME" ,"scop-lr10-ls01")
< iocBoot/common/init_asyn.cmd
epicsEnvSet("NODE_NAME" ,"scop-lr10-ls02")
< iocBoot/common/init_asyn.cmd
epicsEnvSet("NODE_NAME" ,"scop-mcc0-sc01")
< iocBoot/common/init_asyn.cmd
epicsEnvSet("NODE_NAME" ,"scop-mcc0-sc03")
< iocBoot/common/init_asyn.cmd

# Load record instances
dbLoadRecords("db/${IOC}.db")

iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-amrf-rf01,P=SCOP:AMRF:RF01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-amrf-rf03,P=SCOP:AMRF:RF03")

# Setup autosave/restore
< iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
caPutLogShow(2)

# Start autosave routines to save our data
< iocBoot/common/autoSaveRun.cmd

# End of file
