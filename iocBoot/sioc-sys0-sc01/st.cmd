#!../../bin/rhel7-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for LCLS Scopes
#
#  Name: st.cmd
#
#  Facility:  LCLS Oscilloscope Controls
#
#  Auth: 29-Apr-2020, Garth Brown     (GBROWN)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME", "SIOC:SYS0:SC01")
epicsEnvSet("LOCATION", "lcls-daemon1")
epicsEnvSet("ENGINEER", "Garth Brown")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-li10-nw01,P=SCOP:LI10:NW01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-lr20-ls01,P=SCOP:LR20:LS01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-lr20-ls02,P=SCOP:LR20:LS02")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-mcc0-sc01,P=SCOP:MCC0:SC01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-mcc0-sc03,P=SCOP:MCC0:SC03")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-amrf-rf01,P=SCOP:AMRF:RF01")
# scop-amrf-rf03 is a DPO2024, for which TDS3000Reboot is not supported.
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-amrf-rf03,P=SCOP:AMRF:RF03,REBOOT="#"")

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
