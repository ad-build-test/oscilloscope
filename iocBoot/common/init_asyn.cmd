#==============================================================
#
#  Abs:  Initalize Tektronix TDS series 
#
#  Name: init_asyn.cmd
#
#  Rem:  Upon entry we expect to be at location TOP
#        and the following macros must be defined.
#
#           NODE_NAME - Scope node name (e.g. scop-lgun-ls02)
#
#        Upon exiting this script the directory
#        will be set to the TOP of the IOC Application.
#
#  Facility: EED Oscilloscope Controls
#
#  Auth: 15-May-2019, Garth Brown     (GBROWN)
#  Rev:  dd-mmm-yyyy, Reviewer's Name (USERNAME)
#--------------------------------------------------------------
#  Mod:
#        dd-mmm-yyyy, First Lastname  (USERNAME):
#          comment
#
#==============================================================
#

# Power cycle scope. Workaround for network connection bugs in this series scope.
# Function is from asyn vxi11 support
TDS3000Reboot(${NODE_NAME})
epicsThreadSleep(50)
vxi11Configure( "${NODE_NAME}-vxi11","$(NODE_NAME)",0,0.0,"inst0",0,0)
drvTDSConfigure("${NODE_NAME}-port" ,"${NODE_NAME}-vxi11")

#asynSetTraceMask("L0",-1,0x0f)
#asynSetTraceIOMask("L0",-1,0x6)


# End of script

