include $(DVD_MAKE)/generic.mak
APPNAME = ovthisi

#此处增加编译的根目录
COMPILE_MODULES = bitmap_jz dbs flash fonts menu string_jz ../mid ../ext ../third

all: $(APPNAME) install

$(APPNAME):APP_MODULES copylib
	$(CC_PLUS) -Wl,--start-group $(APP_LIB) $(PLATFORM_LIB) $(CFG_OPT) -L$(LIBDIR) -lm -lpthread -lrt  -Wl,--end-group -o $@.exe -Wl,-Map=$(APPNAME).map

APP_MODULES:
	@set -e;for i in $(COMPILE_MODULES); do $(MAKE) -C $$i; done
	
copylib:
	@$(MAKE) -C $(PLATFORM_LIBDIR)	

install:
	@echo "install ovt app to nfs root .... "
ifeq "SW_VERSION" "RELEASE"
	$(STRIP) $(APPNAME).exe
endif
	@cp $(WORK_ROOT)/../ext/bootkernelcfg/inittab $(HISI_ROOTBOX)/etc/inittab
	-@cp $(APPNAME).exe $(HISI_ROOTBOX)/root -f
	-@rm `find ./ -name *.d` -f
	-@cp $(WORK_ROOT)/../ext/bootkernelcfg/profile-nfs-3110q $(HISI_ROOTBOX)/etc/profile -f
ifeq ($(LED_ENABLE),1)
	-@cp $(WORK_ROOT)/../ext/bootkernelcfg/autorun-nfs-3110q-pt6964 $(HISI_ROOTBOX)/etc/init.d/autorun -f
else
	-@cp $(WORK_ROOT)/../ext/bootkernelcfg/autorun-nfs-3110q $(HISI_ROOTBOX)/etc/init.d/autorun -f
endif
	-@cp $(WORK_ROOT)/../ext/others/3110q/runapp $(HISI_ROOTBOX)/root
	-@chmod 777 $(HISI_ROOTBOX)/root/runapp

mkfs:all
	-@echo "copy $(HISI_ROOTBOX)/root/* to image/app"
	-@sleep 2
	-@mkdir -p $(HISI_ROOTBOX)/../image/app
	-@rm $(HISI_ROOTBOX)/../image/app/* -rf
	-@rm -f `find $(HISI_ROOTBOX) -name apidebug`
	-@rm $(HISI_ROOTBOX)/root/kmod -rf
	-@mv $(HISI_ROOTBOX)/kmod $(HISI_ROOTBOX)/root/
	@cp  $(HISI_ROOTBOX)/root/* $(HISI_ROOTBOX)/../image/app -a
	-@echo "...done"
	-@echo "delete all files of $(HISI_ROOTBOX)/root/*"
	-@rm $(HISI_ROOTBOX)/root/* -rf
	-@rm $(HISI_ROOTBOX)/db/* -f
	-@rm $(HISI_ROOTBOX)/home/* -f
	-@rm $(HISI_ROOTBOX)/*.bin -f
	-@rm $(HISI_ROOTBOX)/*.cramfs -f
	-@rm $(HISI_ROOTBOX)/*.mpg -f
	-@echo ...done
	@cp -v $(WORK_ROOT)/../ext/bootkernelcfg/profile-fls-3110q $(HISI_ROOTBOX)/etc/profile -f 
	@cp -v $(WORK_ROOT)/../ext/bootkernelcfg/inittab $(HISI_ROOTBOX)/etc/inittab
ifeq ($(LED_ENABLE),1)
	@cp -v $(WORK_ROOT)/../ext/bootkernelcfg/autorun-fls-3110q-pt6964 $(HISI_ROOTBOX)/etc/init.d/autorun -f
else
	@cp -v $(WORK_ROOT)/../ext/bootkernelcfg/autorun-fls-3110q $(HISI_ROOTBOX)/etc/init.d/autorun -f
endif
	-@echo "make root cramfs to $(HISI_ROOTBOX)/../image/rootbox.cramfs ..."
	@./mkroot.sh
	-@echo "make app cramfs to $(HISI_ROOTBOX)/../image/app.cramfs ..."
	@./mkapp.sh
	-@echo "make rootfs cpio to $(HISI_ROOTBOX)/../image/rootbox.ramfs ..."
	@./mkcpio.sh
	-@cp $(HISI_ROOTBOX)/../image/app.cramfs $(HISI_ROOTBOX)/../image/rootbox.cramfs $(HISI_ROOTBOX)
	-@cp $(HISI_ROOTBOX)/../image/app/kmod $(HISI_ROOTBOX) -a
	-@echo "...done end"

clean : clean_app

clean_app :
	-@echo -e "\033[31m""clean all modules ...""\033[0m"
	@for i in $(COMPILE_MODULES); do $(MAKE) -C $$i clean; done
	-@rm 2>$(NULL) *.exe  -f 
	-@rm 2>$(NULL) `find ./ -name *.o` -f
	-@rm 2>$(NULL) `find ./ -name *.d` -f
	-@rm 2>$(NULL) *.map  -f 
