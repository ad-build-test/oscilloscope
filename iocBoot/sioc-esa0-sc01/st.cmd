#!../../bin/rhel9-x86_64/oscilloscope

#==============================================================
#
#  Abs:  Startup Script for ESA Scopes
#
#  Name: st.cmd
#
#  Facility: Oscilloscope Controls
#
#  Auth: 26-Aug-2025, M. Dunning (mdunning)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME", "SIOC:ESA0:SC01")
epicsEnvSet("LOCATION", "testfac-srv09")
epicsEnvSet("ENGINEER", "M. Dunning")

# Load common startup script
< ../common/st.cmd.soft

# ASTA scope #1
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-esa0-sc01,P=SCOP:ESA0:SC01")

# Setup autosave/restore
< iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
#caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
#caPutLogShow(2)

# Start autosave routines to save our data
< iocBoot/common/autoSaveRun.cmd

# End of file

