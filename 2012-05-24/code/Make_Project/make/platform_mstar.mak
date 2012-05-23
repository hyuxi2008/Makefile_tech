#平台的binutils定义
ifeq "$(FLOAT_POINT_TYPE)" "HFP"
CROSS_COMPILE = mips-linux-gnu-
else
CROSS_COMPILE=mips-linux-gnu-
endif

CC=$(CROSS_COMPILE)gcc
CC_PLUS=$(CROSS_COMPILE)g++
LD=$(CROSS_COMPILE)ld
AR=$(CROSS_COMPILE)ar
RAN=$(CROSS_COMPILE)ranlib
STRIP=$(CROSS_COMPILE)strip
MAKE=make
NULL=/dev/null
export CROSS_COMPILE CC AR LD CC_PLUS

#平台的SDK头文件和库的定义
SDK_INCDIR=$(WORK_ROOT)/../ext/usr/include

PLATFORM_INC=-I$(SDK_INCDIR)\
	-I$(SDK_INCDIR)/../config										\
	-I$(SDK_INCDIR)/../config/include								\
	-I$(SDK_INCDIR)/../platform/driver/swiic                   \
	-I$(SDK_INCDIR)/../platform/driver/scart                   \
	-I$(SDK_INCDIR)/../platform/driver/FrontPnl                \
	-I$(SDK_INCDIR)/../platform/driver/IR		                \
	-I$(SDK_INCDIR)/../platform/driver/cofdm                   \
	-I$(SDK_INCDIR)/../platform/driver/cofdm/implement/DIB8096           \
	-I$(SDK_INCDIR)/../platform/driver/cofdm/implement/FJ2207/inc        \
	-I$(SDK_INCDIR)/../platform/driver/cofdm/implement/FJ2207/tmbslNT220x/inc        \
	-I$(SDK_INCDIR)/../platform/driver/cofdm/implement/FJ2207/tmddNT220x/inc        \
	-I$(SDK_INCDIR)/../platform/driver/cofdm/implement/FJ2207/tmsysOM3869/inc                   \
	-I$(SDK_INCDIR)/../platform/driver/cofdm/implement/MxL5007T_API_Files_V4.1.3                   \
	-I$(SDK_INCDIR)/../platform/driver/pad                      \
	-I$(SDK_INCDIR)/../platform/driver/pq                      \
	-I$(SDK_INCDIR)/../platform/driver/pq/include              \
	-I$(SDK_INCDIR)/../platform/driver/pq/hal/k1_mstar/include  \
	-I$(SDK_INCDIR)/../api/uart                                \
	-I$(SDK_INCDIR)/../api/vdec                                \
	-I$(SDK_INCDIR)/../api/xc                                  \
	-I$(SDK_INCDIR)/../api/gpio                                  \
	-I$(SDK_INCDIR)/../api/sar                                  \
	-I$(SDK_INCDIR)/../api/frontend                              \
	-I$(SDK_INCDIR)/../api/sqllite								\
	-I$(SDK_INCDIR)/../api/pvr

PLATFORM_LIB+=$(LIBDIR)/libapiACE.a\
			$(LIBDIR)/libapiAUDIO.a\
			$(LIBDIR)/libapiCEC.a\
			$(LIBDIR)/libapiDAC.a\
			$(LIBDIR)/libapiDLC.a\
			$(LIBDIR)/libapiDMX.a\
			$(LIBDIR)/libapiGFX.a\
			$(LIBDIR)/libapiGOP.a\
			$(LIBDIR)/libapiHDMITX.a\
			$(LIBDIR)/libapiJPEG.a\
			$(LIBDIR)/libapiPNL.a\
			$(LIBDIR)/libapiSWI2C.a\
			$(LIBDIR)/libapiVDEC.a\
			$(LIBDIR)/libapiXC.a\
			$(LIBDIR)/libdrvAESDMA.a\
			$(LIBDIR)/libdrvAUDIO.a\
			$(LIBDIR)/libdrvAUDSP.a\
			$(LIBDIR)/libdrvBDMA.a\
			$(LIBDIR)/libdrvCPU.a\
			$(LIBDIR)/libdrvDDC2BI.a\
			$(LIBDIR)/libdrvDEMOD.a\
			$(LIBDIR)/libdrvDSCMB.a\
			$(LIBDIR)/libdrvGPIO.a\
			$(LIBDIR)/libdrvHWI2C.a\
			$(LIBDIR)/libdrvIPAUTH.a\
			$(LIBDIR)/libdrvIR.a\
			$(LIBDIR)/libdrvIRQ.a\
			$(LIBDIR)/libdrvMPIF.a\
			$(LIBDIR)/libdrvMVOP.a\
			$(LIBDIR)/libdrvPCMCIA.a\
			$(LIBDIR)/libdrvPM.a\
			$(LIBDIR)/libdrvPWM.a\
			$(LIBDIR)/libdrvPWS.a\
			$(LIBDIR)/libdrvRASP.a\
			$(LIBDIR)/libdrvRTC.a\
			$(LIBDIR)/libdrvSAR.a\
			$(LIBDIR)/libdrvSC.a\
			$(LIBDIR)/libdrvSEM.a\
			$(LIBDIR)/libdrvSERFLASH.a\
			$(LIBDIR)/libdrvSYS.a\
			$(LIBDIR)/libdrvUART.a\
			$(LIBDIR)/libdrvURDMA.a\
			$(LIBDIR)/libdrvUSB_HID_P1.a\
			$(LIBDIR)/libdrvUSB_HID_P2.a\
			$(LIBDIR)/libdrvUSB_HOST_P1.a\
			$(LIBDIR)/libdrvUSB_HOST_P2.a\
			$(LIBDIR)/libdrvVBI.a\
			$(LIBDIR)/libdrvVE.a\
			$(LIBDIR)/libdrvWBLE.a\
			$(LIBDIR)/libdrvWDT.a\
			$(LIBDIR)/liblinux.a\
			$(LIBDIR)/libMsFS.a\
			$(LIBDIR)/libmsAPI_XC.a\
			$(LIBDIR)/libmstar.a

#平台相关的编译选项
ifeq "$(SW_VERSION)" "DEBUG"
PLATFORM_OPT = -Wall -O0 -g -gdwarf-2 -mips32 -EL -msoft-float -Wpointer-arith -Wstrict-prototypes -Winline -Wundef -fno-strict-aliasing -fno-optimize-sibling-calls -ffunction-sections -fdata-sections -fno-exceptions -G0
else
PLATFORM_OPT = -Wall -Os -gdwarf-2 -mips32 -EL -msoft-float -Wpointer-arith -Wstrict-prototypes -Winline -Wundef -fno-strict-aliasing -fno-optimize-sibling-calls -ffunction-sections -fdata-sections -fno-exceptions -G0
endif

ifeq "$(SDK_OS)" "__OS_LINUX"
PLATFORM_OPT += -D$(SDK_OS)
endif

PLATFORM_OPT += -D$(SDK_VERSION)
PLATFORM_OPT += -D'MS_C_STDLIB'
PLATFORM_OPT += -D'MS_BOARD_TYPE_SEL=BD_MST124ESZ_D01A_S'
PLATFORM_OPT += -D'MS_DVB_TYPE_SEL=DVBC'
PLATFORM_OPT += -D'ENABLE_DEBUG=1'
PLATFORM_OPT += -D'STB_ENABLE=1'
PLATFORM_OPT += -D'FBL_ENABLE=0'
PLATFORM_OPT += -D'MBOOT_LOGO_ENABLE=0'
PLATFORM_OPT += -D'SZDEMO_ENABLE=1'
PLATFORM_OPT += -D'MSOS_TYPE_LINUX'
PLATFORM_OPT += -D'BUILDTYPE_EXE'
