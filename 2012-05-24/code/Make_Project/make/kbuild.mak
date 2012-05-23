include $(DVD_MAKE)/stbconfig.mak 

ifndef CROSS_COMPILE
ifeq "$(FLOAT_POINT_TYPE)" "HFP"
CROSS_COMPILE = arm-vfp_uclibc-linux-gnu-
else
CROSS_COMPILE=arm-uclibc-linux-
endif

CC=$(CROSS_COMPILE)gcc
AR=$(CROSS_COMPILE)ar
LD=$(CROSS_COMPILE)ld
#export CROSS_COMPILE CC AR LD
endif

ifndef LINUXROOT
LINUXROOT=$(WORK_ROOT)/../../../code/linux/kernel/linux-2.6.14
#export LINUXROOT
endif

KDIR=$(LINUXROOT)


