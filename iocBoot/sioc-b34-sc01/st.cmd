#!../../bin/rhel9-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the B15 DPO2024 scope
#
#  Name: st.cmd
#
#  Facility:  LCLS Oscilliscope Controls
#
#  Auth: 28-Apr-2022, M. Dunning (mdunning)
#==============================================================
#
# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:B34:SC01")
epicsEnvSet("LOCATION"  ,"lcls-dev1")
epicsEnvSet("ENGINEER"  ,"Mike Dunning")

# Load common startup script
< ../common/st.cmd.soft

# Start driver & load databases
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "P=SCOP:B34:SC01,NODE_NAME=scop-b34-cd01,REBOOT=""")


# Setup autosave/restore
< $(TOP)/iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
#caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
#caPutLogShow(2)

# Start autosave routines to save our data
< $(TOP)/iocBoot/common/autoSaveRun.cmd

# End of file
