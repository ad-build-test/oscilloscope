TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = oscilloscope
# oscilloscope.dbd will be created and installed
DBD += oscilloscope.dbd

# oscilloscope.dbd will be made up from these files:
oscilloscope_DBD += base.dbd

ifneq ($(IOCADMIN),)
oscilloscope_DBD += devIocStats.dbd
endif
ifneq ($(AUTOSAVE),)
oscilloscope_DBD += asSupport.dbd
endif
ifneq ($(CAPUTLOG),)
oscilloscope_DBD += caPutLog.dbd
endif
oscilloscope_DBD += $(CEXP_DBDS)

# ================================================================================
# The system command will be mainly used by linux hosted IOCs
# Very useful for changing kernel thread priorities for kernel drivers
# ================================================================================
oscilloscope_DBD += system.dbd

oscilloscope_DBD += drvAsynIPPort.dbd
oscilloscope_DBD += drvVxi11.dbd
oscilloscope_DBD += asyn.dbd
oscilloscope_DBD += PVAServerRegister.dbd
oscilloscope_DBD += qsrv.dbd
oscilloscope_DBD += drvTDS.dbd
# oscilloscope_registerRecordDeviceDriver.cpp derives from oscilloscope.dbd
oscilloscope_SRCS += oscilloscope_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
oscilloscope_SRCS_DEFAULT += oscilloscopeMain.cpp
oscilloscope_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#oscilloscope_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

ifneq ($(IOCADMIN),)
oscilloscope_LIBS += devIocStats
endif

# Needed to link in autosave support
ifneq ($(AUTOSAVE),)
oscilloscope_LIBS += autosave
endif

# Needed to link caPutLog support
ifneq ($(CAPUTLOG),)
oscilloscope_LIBS += caPutLog
endif

# Needed to link cexpsh() support
oscilloscope_LIBS += $(CEXP_LIBS)
oscilloscope_SYS_LIBS += $(CEXP_SYS_LIBS)

oscilloscope_LIBS += tds3x
oscilloscope_LIBS += scope
oscilloscope_LIBS += asyn
oscilloscope_LIBS += qsrv
# Finally link to the EPICS Base libraries
oscilloscope_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
oscilloscope_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

