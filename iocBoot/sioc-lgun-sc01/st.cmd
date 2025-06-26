#!../../bin/rhel9-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the Laser GunB Scope
#
#  Name: st.cmd
#
#  Facility:  LCLS Oscilliscope Controls
#
#  Auth: 29-Apr-2020, Garth Brown     (GBROWN):
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:LGUN:SC01")
epicsEnvSet("LOCATION"  ,"lcls-daemon1")
epicsEnvSet("ENGINEER"  ,"Garth Brown")

# Load common startup script
< ../common/st.cmd.soft

iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-lgun-ls01,P=SCOP:LGUN:LS01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-lgun-ls02,P=SCOP:LGUN:LS02")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-lgun-ls03,P=SCOP:LGUN:LS03")

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
