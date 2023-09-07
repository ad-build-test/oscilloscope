#!../../bin/rhel7-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for LCLS Scopes
#
#  Name: st.cmd
#
#  Facility:  LCLS Oscilloscope Controls
#
#  Auth: 06-Sep-2023, M. Dunning (mdunning)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME", "SIOC:SYS0:SC02")
epicsEnvSet("LOCATION", "lcls-daemon0")
epicsEnvSet("ENGINEER", "Garth Brown")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
iocshLoad("$(TOP)/iocBoot/common/mdo.cmd", "NODE_NAME=scop-amrf-rf01,P=SCOP:AMRF:RF01")
iocshLoad("$(TOP)/iocBoot/common/mdo.cmd", "NODE_NAME=scop-amrf-rf03,P=SCOP:AMRF:RF03")

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

