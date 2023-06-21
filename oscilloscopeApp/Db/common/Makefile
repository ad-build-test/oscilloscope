TOP=../../..
include $(TOP)/configure/CONFIG
#----------------------------------------
# ADD MACRO DEFINITIONS AFTER THIS LINE
# Install IOC monitoring
DB_INSTALLS += $(IOCADMIN)/db/iocAdminSoft.db
DB_INSTALLS += $(IOCADMIN)/db/iocAdminScanMon.db
IOCRELEASE_DB += iocRelease.db

# Install Database to autosave suport
DB_INSTALLS += $(AUTOSAVE)/db/save_restoreStatus.db

# Asyn serial devices
DB_INSTALLS += $(ASYN)/db/asynRecord.db

# Scope databases
DB_INSTALLS += $(SCOPEASYN)/db/scope.db
DB_INSTALLS += $(SCOPEASYN)/db/tds.db
DB_INSTALLS += $(SCOPEASYN)/db/mdo.db
DB_INSTALLS += $(SCOPEASYN)/db/ds1.db
DB_INSTALLS += $(SCOPEASYN)/db/ds6.db

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
#
# End of file


