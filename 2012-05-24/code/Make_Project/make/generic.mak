include $(DVD_MAKE)/stbconfig.mak 

LIB_PREFIX=lib
LIBDIR=$(WORK_ROOT)/lib
LS_FLG=-l --time-style=long-iso

#先包含平台相关定义
ifeq "$(SDK_VERSION)" "HI3110_Q"
include $(DVD_MAKE)/platform_hisi.mak
endif

ifeq "$(SDK_VERSION)" "HI3110E_C004"
include $(DVD_MAKE)/platform_hisi.mak
endif

ifeq "$(SDK_VERSION)" "MSTAR_ONE"
include $(DVD_MAKE)/platform_mstar.mak
endif

#APP中有关头文件的定义
APPINC=	-I$(WORK_ROOT)/../ext/ext/include\
	-I$(WORK_ROOT)/../mid/mwin/include\
	-I$(WORK_ROOT)/../mid/middle/include\
	-I$(WORK_ROOT)/../mid/engine/include\
	-I$(WORK_ROOT)/../mid/drivers/include\
	-I$(WORK_ROOT)/bitmap_jz/include\
	-I$(WORK_ROOT)/dbs/dbase/include\
	-I$(WORK_ROOT)/fonts/include\
	-I$(WORK_ROOT)/menu/game/include\
	-I$(WORK_ROOT)/menu/menu/include\
	-I$(WORK_ROOT)/menu/menu_ca/menu_ca_interface/include\
	-I$(WORK_ROOT)/menu/menu_ovtpreview/include\
	-I$(WORK_ROOT)/flash/flash\
	-I$(WORK_ROOT)/ovt_loader/include\
	-I$(WORK_ROOT)/string_jz/include\
	-I$(WORK_ROOT)/../third/ovt_preview/include\
	-I$(WORK_ROOT)/../third/ca_select/include

ifeq "$(TFCAS)" "YES"
APPINC += -I$(WORK_ROOT)/../third/tfca/include
endif

ifeq "$(TFCAS_GENERAL)" "YES"
APPINC += -I$(WORK_ROOT)/../third/tfca_general/include
endif

ifeq "$(TFCAS_V2_1)" "YES"
APPINC += -I$(WORK_ROOT)/../third/tfca_v2.1/include
endif

ifeq "$(DVTCAS)" "YES"
APPINC += -I$(WORK_ROOT)/../third/dvtca/include
endif

ifeq "$(DVTCAS_GENERAL)" "YES"
APPINC += -I$(WORK_ROOT)/../third/dvtca_general/include
endif

ifeq "$(DVNCAS)" "YES"
APPINC += -I$(WORK_ROOT)/../third/dvnca/include
endif

ifeq "$(OVTCAS)" "YES"
APPINC += -I$(WORK_ROOT)/../third//ovtca/ovtca_interface/include
APPINC += -I$(WORK_ROOT)/../third//ovtca
endif

ifeq "$(EOC_2M_SUPPORT)" "1"
APPINC += -I$(WORK_ROOT)/../third/2m_eoc_kernel/include
endif

ifeq "$(OVTTM_SELECT)" "SS01_CIXI"
APPINC += -I$(WORK_ROOT)/../third/OVTTM_SS02_CIXI/ovt_vod/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_SS02_CIXI/ovt_interface/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_SS02_CIXI/ovt_browser/include
endif

ifeq "$(OVTTM_SELECT)" "SS01_DANDONG"
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_vod/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_interface/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_browser/include
endif

ifeq "$(OVTTM_SELECT)" "SS01_TENGCHONG"
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_vod/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_interface/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_browser/include
endif

ifeq "$(OVTTM_SELECT)" "SS01_QUJIANG"
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_vod/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_interface/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_browser/include
endif

ifeq "$(OVTTM_SELECT)" "HS01_HANGTIAN"
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_vod/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_interface/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_browser/include
APPINC += -I$(WORK_ROOT)/../third/opensource/freetype-2.3.12/code/include
APPINC += -I$(WORK_ROOT)/../third/opensource/freetype-2.3.12/code/include/freetype/config
endif

ifeq "$(OVTTM_SELECT)" "HS01_DANDONG"
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_vod/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_interface/include
APPINC += -I$(WORK_ROOT)/../third/OVTTM_PUBLIC/ovt_browser/include
APPINC += -I$(WORK_ROOT)/../third/opensource/freetype-2.3.12/code/include
APPINC += -I$(WORK_ROOT)/../third/opensource/freetype-2.3.12/code/include/freetype/config
endif

ifeq "$(RUJIA_MIS_SUPPORT)" "1"
APPINC += -I$(WORK_ROOT)/../third/RUJIA_MIS/mis_interface/include
APPINC += -I$(WORK_ROOT)/../third/RUJIA_MIS/mis_porting/include
endif

ifeq "$(HARMONIC_MOSAIC)" "1"
APPINC += -I$(WORK_ROOT)/../third/Mosaic_xml/
endif

CFG_INC += $(APPINC)

#以下是需要链接的APP库
APP_LIB= -lbitmap_jz -lca_select -ldbs -lfonts -lgame -lmenu -lmenu_ca -lstring_jz -lmid -lext -ldxstbinfo
ifeq "$(OVTVOD_SUPPORT)" "1"
ifeq "$(OVTTM_SELECT)" "SS01_CIXI"
APP_LIB += -lOVTTM_SS02_CIXI
endif
ifeq "$(OVTTM_SELECT)" "SS01_DANDONG"
APP_LIB += -lOVTTM_PUBLIC
endif
ifeq "$(OVTTM_SELECT)" "SS01_TENGCHONG"
APP_LIB += -lOVTTM_PUBLIC
endif
ifeq "$(OVTTM_SELECT)" "SS01_QUJIANG"
APP_LIB += -lOVTTM_PUBLIC
endif
ifeq "$(OVTTM_SELECT)" "HS01_HANGTIAN"
APP_LIB += -lOVTTM_PUBLIC
endif
ifeq "$(OVTTM_SELECT)" "HS01_DANDONG"
APP_LIB += -lOVTTM_PUBLIC
endif
endif

ifeq "$(HARMONIC_MOSAIC)" "1"
APP_LIB += -lMosaic_xml
endif

ifeq "$(EOC_2M_SUPPORT)" "1"
APP_LIB += -lovt_eoc2M_port -l2m_eoc_kernel
endif

ifeq "$(EOC_2M_BANK)" "1"
APP_LIB += -lOVT_BS2 -lovtbrowser2 -lovtmodules
endif

ifeq "$(DVNCAS)" "YES"
APP_LIB += -ldvnca -lDVNCA_DanDong
endif

ifeq "$(TFCAS_GENERAL)" "YES"
APP_LIB += -ltfca -lcdcas_general
endif

ifeq "$(TFCAS)" "YES"
APP_LIB += -ltfca -lcdcas
endif

ifeq "$(TFCAS_V2_1)" "YES"
APP_LIB += -ltfca_v2.1 -ltf_v2_1
endif

ifeq "$(OVTCAS)" "YES"
APP_LIB += -lovtca
endif

ifeq "$(DVTCAS)" "YES"
APP_LIB += -ldvtca 
ifeq "$(MARKETNAME)" "SS01_DANDONG"
APP_LIB += -l110407_V5210_HI3110Q
endif
ifeq "$(MARKETNAME)" "SS01_CIXI"
APP_LIB += -l110126_V5210_HI3110Q
endif
ifeq "$(MARKETNAME)" "SS01_CIXI_JIZHONG"
APP_LIB += -l110126_V5210_HI3110Q
endif
ifeq "$(MARKETNAME)" "SS01_CIXI_JIUZHOU"
APP_LIB += -l110126_V5210_HI3110Q
endif
ifeq "$(MARKETNAME)" "SS01_CIXI_GAOSIBEIER"
APP_LIB += -l110126_V5210_HI3110Q
endif
endif

ifeq "$(OVT_PREVIEW)" "1"
APP_LIB += -lmenu_ovtpreview -lovt_preview_hisi -lovt_preview
endif

#APP,MID,THIRD中有关编译选项的定义
ifeq "$(SDK_VERSION)" "HI3110E_C004"
CFG_OPT += -DHI3110E_C004
endif

ifeq "$(SDK_VERSION)" "HI3110_Q"
CFG_OPT += -D$(SDK_VERSION)
endif

ifeq "$(IRDCAS)" "YES"
CFG_OPT += -DSUPPORT_IRDCA
endif

ifeq "$(TFCAS)" "YES"
CFG_OPT += -DSUPPORT_TFCA
endif

ifeq "$(TFCAS_GENERAL)" "YES"
CFG_OPT += -DSUPPORT_TFCA
endif

ifeq "$(TFCAS_V2_1)" "YES"
CFG_OPT += -DSUPPORT_TFCA
CFG_OPT += -DCATYPE_TFCA_V2_1
endif

ifeq "$(OVTCAS)" "YES"
CFG_OPT += -DSUPPORT_OVTCA
endif

ifeq "$(DVNCAS)" "YES"
CFG_OPT += -DSUPPORT_DVNCA
endif

ifeq "$(DVTCAS)" "YES"
CFG_OPT += -DSUPPORT_DVTCA
endif

ifeq "$(EOC_2M_SUPPORT)" "1"
CFG_OPT += -DEOC_2M
CFG_OPT += -DCMVNETNABLE
endif

ifeq "$(EOC_2M_BANK)" "1"
CFG_OPT += -DEOC_2M_BANK
endif

ifeq "$(RUJIA_MIS_SUPPORT)" "1"
CFG_OPT += -DMIS_RUJIA_FUNC
endif

ifeq "$(HARMONIC_MOSAIC)" "1"
CFG_OPT += -DHARMONIC_MOSAIC
endif

ifeq "$(STANDBY_SUPPORT)" "1"
CFG_OPT += -DSTANDBY_SUPPORT
endif

ifeq "$(OVT_PREVIEW)" "1"
CFG_OPT += -DOVT_PREVIEW
endif

ifeq "$(OVTVOD_SUPPORT)" "1"
CFG_OPT += -DOVTVOD_SUPPORT
endif

ifeq "$(EPGSUBTITLE_SUPPORT)" "1"
CFG_OPT += -DEPGSUBTITLE_SUPPORT
endif

ifeq "$(SMARTCARD_NODETECT)" "1"
CFG_OPT += -DSMARTCARD_NODETECT
endif

CFG_OPT += -D$(DB_STORE_MODE) -D$(LD_TYPE) -D$(OVT_IR_KEYPAD) -D$(MARKETNAME)
CFG_OPT += -D$(FLASH_SIZE) 
CFG_OPT += -DTUNER_DEFINE_MODE=$(TUNER_DEFINE_MODE)

ifeq "$(OVTVOD_SUPPORT)" "1"
ifeq "$(OVTTM_SELECT)" "SS01_CIXI"
include $(WORK_ROOT)/../third/OVTTM_SS02_CIXI/OVTTM_Linux.cfg
endif

ifeq "$(OVTTM_SELECT)" "SS01_DANDONG"
include $(WORK_ROOT)/../third/OVTTM_PUBLIC/OVTTM_Linux.cfg
endif

ifeq "$(OVTTM_SELECT)" "SS01_TENGCHONG"
include $(WORK_ROOT)/../third/OVTTM_PUBLIC/OVTTM_Linux.cfg
endif

ifeq "$(OVTTM_SELECT)" "SS01_QUJIANG"
include $(WORK_ROOT)/../third/OVTTM_PUBLIC/OVTTM_Linux.cfg
endif

ifeq "$(OVTTM_SELECT)" "HS01_HANGTIAN"
include $(WORK_ROOT)/../third/OVTTM_PUBLIC/OVTTM_Linux.cfg
endif

ifeq "$(OVTTM_SELECT)" "HS01_DANDONG"
include $(WORK_ROOT)/../third/OVTTM_PUBLIC/OVTTM_Linux.cfg
endif
endif

include $(WORK_ROOT)/../mid/MID_Linux.cfg
