TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

# =====================================================
# Path to "NON EPICS" External PACKAGES: USER INCLUDES
# =====================================================

# ======================================================
# PATH TO "NON EPICS" EXTERNAL PACKAGES: USER LIBRARIES
# ======================================================
tirpc_DIR = $(TIRPC_LIB)
# ======================================================

# ======================================================
# LINK "NON EPICS" EXTERNAL PACKAGE LIBRARIES STATICALLY
# =======================================================
ifeq ($(NEEDS_TIRPC),YES)
USR_LIBS_Linux += tirpc
endif
# =======================================================

#=============================
# Build the IOC application
PROD_NAME = oscilloscope
PROD_IOC = $(PROD_NAME)

# $(PROD_NAME).dbd will be created and installed
DBD += $(PROD_NAME).dbd

# $(PROD_NAME).dbd will be made up from these files:
$(PROD_NAME)_DBD += base.dbd

ifneq ($(IOCADMIN),)
$(PROD_NAME)_DBD += devIocStats.dbd
endif
ifneq ($(AUTOSAVE),)
$(PROD_NAME)_DBD += asSupport.dbd
endif
ifneq ($(CAPUTLOG),)
$(PROD_NAME)_DBD += caPutLog.dbd
endif

$(PROD_NAME)_DBD += asyn.dbd
$(PROD_NAME)_DBD += drvAsynIPPort.dbd
$(PROD_NAME)_DBD += drvVxi11.dbd
$(PROD_NAME)_DBD += drvTDS.dbd
$(PROD_NAME)_DBD += drvMDO.dbd
$(PROD_NAME)_DBD += drvDS1x.dbd
$(PROD_NAME)_DBD += drvDS6x.dbd
$(PROD_NAME)_DBD += system.dbd

ifdef EPICS_QSRV_MAJOR_VERSION
$(PROD_NAME)_DBD += PVAServerRegister.dbd
$(PROD_NAME)_DBD += qsrv.dbd
endif


$(PROD_NAME)_SRCS += $(PROD_NAME)_registerRecordDeviceDriver.cpp
$(PROD_NAME)_SRCS_DEFAULT += $(PROD_NAME)Main.cpp


ifneq ($(IOCADMIN),)
$(PROD_NAME)_LIBS += devIocStats
endif

# Needed to link in autosave support
ifneq ($(AUTOSAVE),)
$(PROD_NAME)_LIBS += autosave
endif

# Needed to link caPutLog support
ifneq ($(CAPUTLOG),)
$(PROD_NAME)_LIBS += caPutLog
endif

$(PROD_NAME)_LIBS += tds3x
$(PROD_NAME)_LIBS += mdo3x
$(PROD_NAME)_LIBS += ds1x
$(PROD_NAME)_LIBS += ds6x
$(PROD_NAME)_LIBS += asyn

ifdef EPICS_QSRV_MAJOR_VERSION
$(PROD_NAME)_LIBS += qsrv
$(PROD_NAME)_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
endif

# Finally link to the EPICS Base libraries
$(PROD_NAME)_LIBS += $(EPICS_BASE_IOC_LIBS)
#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

