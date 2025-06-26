#!../../bin/rhel9-x86_64/oscilloscope
#==============================================================
#
#  Abs:  Startup Script for the Laser GunB Scope
#
#  Name: st.cmd
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

# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:LHTR:SC10")
epicsEnvSet("LOCATION"  ,"lcls-daemon0")
epicsEnvSet("ENGINEER"  ,"Shawn Alverson")

# Load common startup script
< ../common/st.cmd.soft

# Old Rigol scope
#iocshLoad("$(TOP)/iocBoot/common/ds1.cmd", "NODE_NAME=scop-lhtr-ls10,P=SCOP:LHTR:LS10")

# New Textronix MDO
iocshLoad("$(TOP)/iocBoot/common/mdo.cmd", "P=SCOP:LHTR:LS10,NODE_NAME=scop-lhtr-ls10")

# Setup autosave/restore
< iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Old support for Rigol
# epicsThreadSleep(1)
# dbpf "SCOP:LHTR:LS10:BO_UPDATE.SCAN","0"
# dbpf "SCOP:LHTR:LS10:MBBO_TRACE_MODE",1
# dbpf SCOP:LHTR:LS10:BO_TIMDLY_STATE 1
# dbpf SCOP:LHTR:LS10:BO_RD_TRACE 1
# dbpf SCOP:LHTR:LS10:WF_SAV_PATH "/u1/lcls/physics/Oscilloscope/${IOC}"

# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
caPutLogInit("${EPICS_CA_PUT_LOG_ADDR}")
caPutLogShow(2)

# Start autosave routines to save our data
< iocBoot/common/autoSaveRun.cmd

# End of file
