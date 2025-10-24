#!../../bin/rhel9-x86_64/oscilloscope

#==============================================================
#
#  Abs:  Startup Script for Scopes
#
#  Name: st.cmd
#
#  Facility:  XTA Oscilliscope Controls
#
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME" ,"SIOC:SYS6:SC01")
epicsEnvSet("LOCATION" ,"testfac-srv09")
epicsEnvSet("ENGINEER" ,"M. Dunning")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-xt01-sc01,P=SCOP:XT01:SC01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-xt01-sc02,P=SCOP:XT01:SC02")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-xt01-sc03,P=SCOP:XT01:SC03")

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
