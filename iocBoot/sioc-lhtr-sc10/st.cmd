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
#        18-Jan-2023, S. Alverson      (alverson):
#         Modified for use with Rigol scope
#
#==============================================================
#
# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:LHTR:SC10")
epicsEnvSet("LOCATION"  ,"lcls-daemon0")
epicsEnvSet("ENGINEER"  ,"Shawn Alverson")

# Load common startup script
< ../common/st.cmd.rigolds1

epicsEnvSet( EPICS_CA_MAX_ARRAY_BYTES,100000)
# epicsEnvSet( ETHER, "scop-lhtr-ls10")
# epicsEnvSet( "PORT","SCOP")
# epicsEnvSet( "UDPP","L0")
# epicsEnvSet( "LOC","CHA")

iocshLoad("$(TOP)/iocBoot/common/ds1.cmd", "NODE_NAME=scop-lhtr-ls10,P=SCOP:LHTR:LS10")

# Setup autosave/restore
< iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

epicsThreadSleep(1)
dbpf "SCOP:LHTR:LS10:BO_UPDATE.SCAN","0"
dbpf "SCOP:LHTR:LS10:MBBO_TRACE_MODE",1
dbpf SCOP:LHTR:LS10:BO_TIMDLY_STATE 1
dbpf SCOP:LHTR:LS10:BO_RD_TRACE 1
# dbpf SCOP:LHTR:LS10:WF_SAV_PATH "/u1/lcls/physics/Oscilloscope/${IOC}"

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
caPutLogShow(2)

# Start autosave routines to save our data
< iocBoot/common/autoSaveRun.cmd

# End of file
