#!../../bin/rhel7-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the Laser GunB Scope
#
#  Name: st.cmd
#
#  Desc:  This is the EPICS startup script for a soft IOC
#         that will control the vacuum system in
#         the FACET-II injector, which is located at
#         sector 10. This IOC will be using the
#         facet facility computer control infrastructure.
#
#  Facility:  LCLS Oscilliscope Controls
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
epicsEnvSet("IOC_NAME"  ,"SIOC:LGUN:SC01")
epicsEnvSet("LOCATION"  ,"lcls-daemon1")
epicsEnvSet("ENGINEER"  ,"Garth Brown")
# epicsEnvSet("NODE_NAME" ,"scop-lgun-ls02")

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
