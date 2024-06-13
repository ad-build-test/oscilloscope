#!../../bin/rhel7-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for ASTA Scopes
#
#  Name: st.cmd
#
#  Facility:  ASTA Oscilloscope Controls
#
#  Auth: 13-Jun-2024, M. Dunning (mdunning)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME", "SIOC:AS01:SC01")
epicsEnvSet("LOCATION", "testfac-daemon1")
epicsEnvSet("ENGINEER", "M. Dunning")

# Load common startup script
< ../common/st.cmd.soft

# ASTA scope #1
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=sioc-asta-scop03,P=SCOP:AS01:SC01")

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

