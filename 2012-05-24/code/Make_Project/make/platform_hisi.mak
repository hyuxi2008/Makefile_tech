#平台的binutils定义
ifeq "$(FLOAT_POINT_TYPE)" "HFP"
CROSS_COMPILE = arm-vfp_uclibc-linux-gnu-
else
CROSS_COMPILE=arm-uclibc-linux-
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
	-I$(SDK_INCDIR)/common\
	-I$(SDK_INCDIR)/ecs\
	-I$(SDK_INCDIR)/vo\
	-I$(SDK_INCDIR)/video\
	-I$(SDK_INCDIR)/audio\
	-I$(SDK_INCDIR)/demux\
	-I$(SDK_INCDIR)/sync\
	-I$(SDK_INCDIR)/tde\
	-I$(SDK_INCDIR)/video\
	-I$(SDK_INCDIR)/jpg\
	-I$(SDK_INCDIR)/mixer\
	-I$(SDK_INCDIR)/osd\
	-I$(SDK_INCDIR)/pvr\
	-I$(SDK_INCDIR)/tde\
	-I$(SDK_INCDIR)/vbi\
	-I$(SDK_INCDIR)/cursor\
	-I$(SDK_INCDIR)/mmz\
	-I$(SDK_INCDIR)/vd\
	-I$(SDK_INCDIR)/player\
	-I$(SDK_INCDIR)/unf\
	-I$(SDK_INCDIR)/higo

PLATFORM_LIB= $(LIBDIR)/libhigo.a\
     $(LIBDIR)/libhigoadp.a\
     $(LIBDIR)/libpng.a\
     $(LIBDIR)/libz.a
LINK = STATIC
#LINK = SHARE

ifeq ($(LINK), STATIC)  
ifeq "$(SDK_VERSION)" "HI3110E_C004"
PLATFORM_LIB+=$(LIBDIR)/libhimpiunf.a\
     $(LIBDIR)/libhiecsunf.a\
     $(LIBDIR)/libhimpi.a\
     $(LIBDIR)/libhiecs.a\
     $(LIBDIR)/libhimmz.a\
     $(LIBDIR)/libhiplayer.a\
     $(LIBDIR)/libavcodec.a\
     $(LIBDIR)/libavformat.a\
     $(LIBDIR)/libavutil.a\
     $(LIBDIR)/libpetimer.a\
     $(LIBDIR)/libmp3dec.a\
     $(LIBDIR)/libhimpi.a\
     $(LIBDIR)/libhiecs.a\
     $(LIBDIR)/libhimmz.a\
     $(LIBDIR)/libhievent.a
else
PLATFORM_LIB+=$(LIBDIR)/libhimpiunf.a\
     $(LIBDIR)/libhiecsunf.a\
     $(LIBDIR)/libhimpi.a\
     $(LIBDIR)/libhiecs.a\
     $(LIBDIR)/libhimmz.a\
     $(LIBDIR)/libavcodec.a\
     $(LIBDIR)/libavformat.a\
     $(LIBDIR)/libavutil.a\
     $(LIBDIR)/libpetimer.a\
     $(LIBDIR)/libhimpi.a\
     $(LIBDIR)/libhiecs.a\
     $(LIBDIR)/libjpeg.a\
     $(LIBDIR)/libpng.a\
     $(LIBDIR)/libhimmz.a
endif
endif

ifeq ($(LINK), SHARE)   
ifeq "$(SDK_VERSION)" "HI3110E_C004"
PLATFORM_LIB+=$(LIBDIR)/libhimpiunf.so\
     $(LIBDIR)/libhiecsunf.so\
     $(LIBDIR)/libhimpi.so\
     $(LIBDIR)/libhiecs.so\
     $(LIBDIR)/libhimmz.so\
     $(LIBDIR)/libhievent.so\
     $(LIBDIR)/llibcatask_sfp.so\
     $(LIBDIR)/libcacore_sfp.so
else
PLATFORM_LIB+=$(LIBDIR)/libhimpiunf.so\
     $(LIBDIR)/libhiecsunf.so\
     $(LIBDIR)/libhimpi.so\
     $(LIBDIR)/libhiecs.so\
     $(LIBDIR)/libhimmz.so
endif
endif

#平台相关的编译选项
ifeq "$(SW_VERSION)" "DEBUG"
PLATFORM_OPT= -Wall -O0 -march=armv5te -ggdb -gdwarf-2
else
PLATFORM_OPT= -Wall -O2 -march=armv5te
endif

ifeq "$(SDK_OS)" "__OS_LINUX"
PLATFORM_OPT += -D$(SDK_OS)
endif
