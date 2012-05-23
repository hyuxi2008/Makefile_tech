
include $(DVD_MAKE)/generic.mak

ifeq "$(SDK_VERSION)" "HI3110_Q"
$(warning using 3110Q makefile)
$(shell sleep 1)
include 3110q.makefile
endif

ifeq "$(SDK_VERSION)" "HI3110E_C004"
$(warning using 3110E makefile)
$(shell sleep 1)	
include 3110e.makefile
endif

ifeq "$(SDK_VERSION)" "MSTAR_ONE"
$(warning using MSTAR_ONE makefile)
$(shell sleep 1)	
include mstar.makefile
endif