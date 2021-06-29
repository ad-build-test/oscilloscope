#!../../bin/rhel6-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the FACET-II Scopes
#
#  Name: st.cmd
#
#  Desc:  This is the EPICS startup script for a soft IOC
#         that will control the vacuum system in
#         the FACET-II injector, which is located at
#         sector 10. This IOC will be using the
#         facet facility computer control infrastructure.
#
#  Facility:  FACET-II Oscilliscope Controls
#
#  Auth: 29-Apr-2020, Garth Brown     (GBROWN):
#  Rev:  dd-mmm-yyyy, Reviewer's Name (USERNAME)
#--------------------------------------------------------------
#  Mod:
#        08-Apr-2020, K. Luchini      (LUCHINI):
#         add standard header
#         chg db loaded
#
#==============================================================
#
# Set environment variables
epicsEnvSet("IOC_NAME" ,"SIOC:SYS1:SC01")
epicsEnvSet("LOCATION" ,"facet-daemon1")
epicsEnvSet("ENGINEER" ,"Garth Brown")

# Load common startup script
< ../common/st.cmd.soft


# Initalize hardware
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-li20-ex01,P=SCOP:LI20:EX01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-in10-fc01,P=SCOP:IN10:FC01")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-in10-fc02,P=SCOP:IN10:FC02")
iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-mcc0-sc02,P=SCOP:MCC0:SC02")

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
