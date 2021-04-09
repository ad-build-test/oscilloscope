#!../../bin/rhel6-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for Scopes
#
#  Name: st.cmd
#
#  Desc:  This is the EPICS startup script for a soft IOC
#         that will control the vacuum system in
#         the FACET-II injector, which is located at
#         sector 10. This IOC will be using the
#         facet facility computer control infrastructure.
#
#  Facility:  XTA Oscilliscope Controls
#
#  Auth: 09-Apr-2021, K. Luchini      (LUCHINI)
#  Rev:  dd-mmm-yyyy, Reviewer's Name (USERNAME)
#--------------------------------------------------------------
#  Mod:
#        09-Apr-2021, K. Luchini      (LUCHINI):
#         comment out eioc-xt01-dso0001, as it's been removed,
#         but it may be replaced later
#
#==============================================================
#
# Set environment variables
epicsEnvSet("IOC_NAME" ,"SIOC:SYS6:SC01")
epicsEnvSet("LOCATION" ,"testfac-daemon1")
epicsEnvSet("ENGINEER" ,"Garth Brown")

# Load common startup script
< ../common/st.cmd.soft

# Initalize hardware
#epicsEnvSet("NODE_NAME","eioc-xt01-dso001")
#< iocBoot/common/init_asyn.cmd
epicsEnvSet("NODE_NAME","eioc-xt01-dso002")
< iocBoot/common/init_asyn.cmd

# Load record instances
dbLoadRecords("db/${IOC}.db")

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
