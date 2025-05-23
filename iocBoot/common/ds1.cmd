#==============================================================
#
#  Abs:  Common Rigol DS1x series startup script for soft IOCs
#
#  Name: ds1.cmd
#
#  Rem:  Upon entry we expect to be at location TOP
#        and the following macros must be defined.
#
#           P - scope control PV prefix, e.g. SCOP:LGUN:LS02
#           NODE_NAME - Network host name of the scope, e.g. scop-lgun-ls02
#
#        Upon exiting this script the directory
#        will be set to the TOP of the IOC Application.
#
#  Facility: EED BCS Controls
#
#  Auth: 15-May-2019, Garth Brown  (GWBROWN)
#  Rev:  dd-mmm-yyyy, Reviewer's Name (USERNAME)
#--------------------------------------------------------------
#  Mod:
#        dd-mmm-yyyy, First Lastname  (USERNAME):
#          comment
#
#==============================================================
#

epicsEnvSet("UDPP", "${NODE_NAME}-vxi11")
epicsEnvSet("PORT", "${NODE_NAME}-port")

vxi11Configure("$(UDPP)","$(NODE_NAME)",0,"0.0","inst0",0,0)
dbLoadRecords("db/asynRecord.db","P=$(P):,R=ASYN_VXI11,PORT=$(UDPP),ADDR=0,IMAX=0,OMAX=0")
drvDS1xConfigure("$(PORT)","$(UDPP)")
dbLoadRecords("db/asynRecord.db","P=$(P):,R=ASYN_DS1,PORT=$(PORT),ADDR=0,IMAX=0,OMAX=0")

#asynSetTraceMask("L0",-1,0x0f)
#asynSetTraceIOMask("L0",-1,0x2)

#dbLoadRecords( "db/scope.db","P=$(LOC):$(PORT),L=0,A=9,NAME=Rigol,PORT=$(PORT)")
dbLoadRecords("db/scope.db","P=$(P),NAME=Rigol,PORT=$(PORT)")
dbLoadRecords("db/ds1.db","P=$(P),PORT=$(PORT)")

# End of script

