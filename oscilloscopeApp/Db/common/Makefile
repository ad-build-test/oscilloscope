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
DB += $(ASYN)/db/asynRecord.db

# Scope databases
DB += $(SCOPEASYN)/db/scope.db
DB += $(SCOPEASYN)/db/tds.db
DB += $(SCOPEASYN)/db/mdo.db
DB += $(SCOPEASYN)/db/ds1.db
DB += $(SCOPEASYN)/db/ds6.db

DB += sc_common.db

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
#
# End of file


