#==============================================================
#
#  Abs:  Start the autosave task (for a soft IOC)
#
#  Name: autoSaveRun.cmd
#
#  Side: load this script after iocInit
#
#       Upon entry this script expects the following
#       macros must be defined:
#
#         IOC      - IOC name, lower case (e.g. sioc-sys0-sc01)
#         IOC_DATA - path to data area for ioc
#
#       "In the lore that has built up around autosave,
#        PV's that should be restored only before record
#        initialization have been termed "positions".
#        All other PV's have been termed "settings".
#
#        Thus, you might run across a file called
#        'auto_positions.req', and now you'll know that
#        the parameters in this file are intended to be
#        restored only during autosave's pass-0."
#           - from autosave documentation
#
#        This script expects the following
#        macros tobe defined upon entry:
#          a) TOP        - Enviroment varilable for path to top of IOC Application
#          b) /data      - NFS Mount for IOC data directory
#          c) the status prefix has been set for autosave
#          d) the request and save files locations have been dset
#          e) the save_restoreStatus.db has been loaded
#
#  Facility:  EED Oscilloscope Control
#
#  Auth: 15-May-2018, Kristi Luchini  (LUCHINI)
#  Rev:  dd-mmm-yyyy, Reviewer's Name (USERNAME)
#--------------------------------------------------------------
#  Mod:
#        dd-mmm-yyyy, First Lastname  (USERNAME):
#          comment
#
#==============================================================
#
# Wait before building autosave files
epicsThreadSleep(1)

# Generate the autosave PV list
# Note we need change directory to
# where we are saving the restore
# request file.
cd("${IOC_DATA}/${IOC}/autosave-req")
makeAutosaveFiles()

# Start the save_restore task
# save changes on change, but no faster
# than every 5 seconds.
# Note: the last arg cannot be set to 0
create_monitor_set("info_positions.req", 5 )
create_monitor_set("info_settings.req" , 30 )

# change directory to top of application data
cd("${IOC_DATA}/${IOC}")
pwd()

# End of script
