#==============================================================
#
#  Abs:  Common Tektronix MDO series startup script for soft IOCs
#
#  Name: mdo.cmd
#
#  Rem:  Upon entry we expect to be at location TOP
#        and the following macros must be defined:
#           P - scope control PV prefix, e.g. SCOP:LGUN:LS02
#           NODE_NAME - Network host name of the scope, e.g. scop-lgun-ls02
#
#  Facility: EED
#
#  Auth: 08-Jun-2023, M. Dunning (mdunning)
#==============================================================

epicsEnvSet("UDPP", "${NODE_NAME}-vxi11")
epicsEnvSet("PORT", "${NODE_NAME}-port")

vxi11Configure("$(UDPP)","$(NODE_NAME)",0,0.0,"inst0",0,0)
dbLoadRecords("db/asynRecord.db","P=$(P):,R=ASYN_VXI11,PORT=$(UDPP),ADDR=0,IMAX=0,OMAX=0")

drvMDOConfigure("$(PORT)","$(UDPP)")
dbLoadRecords("db/asynRecord.db","P=$(P):,R=ASYN_MDO,PORT=$(PORT),ADDR=0,IMAX=0,OMAX=0")

#asynSetTraceMask("$(UDPP)", -1, 0x11)
#asynSetTraceIOMask("$(UDPP)", -1, 0x1)

#asynSetTraceMask("$(PORT)", -1, 0x11)
#asynSetTraceIOMask("$(PORT)", -1, 0x1)

dbLoadRecords("db/scope.db", "P=$(P),NAME=MDO,PORT=$(PORT)")
dbLoadRecords("db/mdo.db", "P=$(P),PORT=$(PORT)")

# End of script

