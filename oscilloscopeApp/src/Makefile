TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = oscilloscope rigolDS1 rigolDS6
# oscilloscope.dbd will be created and installed (make separate dbd for Rigol scopes for now)
DBD += oscilloscope.dbd rigolDS1.dbd rigolDS6.dbd

# oscilloscope.dbd will be made up from these files:
scope_DBD += base.dbd

ifneq ($(IOCADMIN),)
scope_DBD += devIocStats.dbd
endif
ifneq ($(AUTOSAVE),)
scope_DBD += asSupport.dbd
endif
ifneq ($(CAPUTLOG),)
scope_DBD += caPutLog.dbd
endif
scope_DBD += $(CEXP_DBDS)

# ================================================================================
# The system command will be mainly used by linux hosted IOCs
# Very useful for changing kernel thread priorities for kernel drivers
# ================================================================================
scope_DBD += system.dbd

scope_DBD += drvAsynIPPort.dbd
scope_DBD += drvVxi11.dbd
scope_DBD += asyn.dbd
scope_DBD += PVAServerRegister.dbd
scope_DBD += qsrv.dbd

# oscilloscope.dbd will be created and installed
oscilloscope_DBD += $(scope_DBD) drvTDS.dbd
rigolDS1_DBD += $(scope_DBD) drvDS1x.dbd
rigolDS6_DBD += $(scope_DBD) drvDS6x.dbd

oscilloscope_SRCS += oscilloscope_registerRecordDeviceDriver.cpp
rigolDS1_SRCS += rigolDS1_registerRecordDeviceDriver.cpp
rigolDS6_SRCS += rigolDS6_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
#oscilloscope_SRCS_DEFAULT += oscilloscopeMain.cpp
#oscilloscope_SRCS_vxWorks += -nil-
USR_SRCS_DEFAULT += oscilloscopeMain.cpp
USR_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#oscilloscope_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

ifneq ($(IOCADMIN),)
scope_LIBS += devIocStats
endif

# Needed to link in autosave support
ifneq ($(AUTOSAVE),)
scope_LIBS += autosave
endif

# Needed to link caPutLog support
ifneq ($(CAPUTLOG),)
scope_LIBS += caPutLog
endif

# Needed to link cexpsh() support
#scope_LIBS += $(CEXP_LIBS)
#scope_SYS_LIBS += $(CEXP_SYS_LIBS)

scope_LIBS += scope
scope_LIBS += asyn
scope_LIBS += qsrv
# Finally link to the EPICS Base libraries
#scope_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
#scope_LIBS += $(EPICS_BASE_IOC_LIBS)

oscilloscope_LIBS += $(CEXP_LIBS) tds3x $(scope_LIBS)
rigolDS1_LIBS += $(CEXP_LIBS) ds1x $(scope_LIBS)
rigolDS6_LIBS += $(CEXP_LIBS) ds6x $(scope_LIBS)

#USR_LIBS_RTEMS     += $(CEXP_LIBS)
#USR_SYS_LIBS_RTEMS += $(CEXP_SYS_LIBS)
USR_LIBS           += $(EPICS_BASE_IOC_LIBS)
USR_LIBS           += $(EPICS_BASE_PVA_CORE_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

