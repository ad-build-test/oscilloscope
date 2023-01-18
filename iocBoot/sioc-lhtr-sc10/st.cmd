#!../../bin/rhel6-x86_64/oscilloscope
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
epicsEnvSet("IOC_NAME"  ,"SIOC:LHTR:SC10")
epicsEnvSet("LOCATION"  ,"lcls-daemon1")
epicsEnvSet("ENGINEER"  ,"Shawn Alverson")

# Load common startup script
< ../common/st.cmd.soft

epicsEnvSet( EPICS_CA_MAX_ARRAY_BYTES,100000)
epicsEnvSet( ETHER, "scop-lhtr-ls10")
epicsEnvSet( "PORT","SCOP")
epicsEnvSet( "UDPP","L0")
epicsEnvSet( "LOC","CHA")

iocshLoad("$(TOP)/iocBoot/common/tds.cmd", "NODE_NAME=scop-lhtr-ls10,P=SCOP:LHTR:LS10")

# Setup autosave/restore
< iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

epicsThreadSleep(1)
dbpf "$(LOC):$(PORT):BO:UPDATE.SCAN","0"
dbpf "$(LOC):$(PORT):MBBO:TRACE:MODE",1
dbpf $(LOC):$(PORT):BO:TIMDLY:STATE 1
dbpf $(LOC):$(PORT):BO:RD:TRACE 1
# dbpf $(LOC):$(PORT):WF:SAV:PATH "/u1/lcls/physics/Oscilloscope/${IOC}"

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
caPutLogShow(2)

# Start autosave routines to save our data
< iocBoot/common/autoSaveRun.cmd

# End of file
