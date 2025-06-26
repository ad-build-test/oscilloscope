#!../../bin/rhel9-x86_64/oscilloscope
#==============================================================
#  Abs:  Startup Script for Rigol DS1x scope
#
#  Name: st.cmd
#
#  Facility:  LCLS Oscilliscope Controls
#
#  Auth: 08-Jun-2023, M. Dunning (mdunning)
#==============================================================

# Set environment variables
epicsEnvSet("IOC_NAME"  ,"SIOC:B34:SC03")
epicsEnvSet("LOCATION"  ,"lcls-dev1")
epicsEnvSet("ENGINEER"  ,"Mike Dunning")

# Load common startup script
< ../common/st.cmd.soft

# Start driver & load databases
iocshLoad("$(TOP)/iocBoot/common/ds1.cmd", "P=SCOP:B34:SC273,NODE_NAME=192.168.1.194")

# Set up autosave/restore
#< $(TOP)/iocBoot/common/autoSaveConf.cmd

# Start EPICS
iocInit()

# Start autosave routines to save our data
#< $(TOP)/iocBoot/common/autoSaveRun.cmd

cd("${TOP}")

dbpf "SCOP:B34:SC273:BO_UPDATE.SCAN" 0
dbpf "SCOP:B34:SC273:MBBO_TRACE_MODE" 1
dbpf "SCOP:B34:SC273:BO_TIMDLY_STATE" 1
dbpf "SCOP:B34:SC273:BO_RD_TRACE" 1

# End of file

