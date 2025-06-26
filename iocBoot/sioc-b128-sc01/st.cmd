#!../../bin/rhel9-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the MDO34 scope
#
#  Name: st.cmd
#
#  Facility:  LCLS Oscilliscope Controls
#
#  Auth: 10-Oct-2023, M. Dunning (mdunning)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:B128:SC01")
epicsEnvSet("LOCATION"  ,"testfac-daemon1")
epicsEnvSet("ENGINEER"  ,"Mike Dunning")

# Load common startup script
< ../common/st.cmd.soft

# Start driver & load databases
iocshLoad("$(TOP)/iocBoot/common/mdo.cmd", "P=SCOP:B128:SC01,NODE_NAME=scop-b128-sc01")

# Set up autosave/restore
< $(TOP)/iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
#caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
#caPutLogShow(2)

# Start autosave routines to save our data
< $(TOP)/iocBoot/common/autoSaveRun.cmd

cd("${TOP}")

# End of file

