#!../../bin/rhel6-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for Scopes
#
#  Name: st.cmd
#
#  Facility:  XTA Oscilliscope Controls
#
#  Auth: 09-Apr-2021, K. Luchini      (LUCHINI)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME" ,"SIOC:SYS6:SC01")
epicsEnvSet("LOCATION" ,"testfac-daemon1")
epicsEnvSet("ENGINEER" ,"Garth Brown")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=eioc-xt01-dso001,P=TDS:XT01:1")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=eioc-xt01-dso002,P=TDS:XT01:2")

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
