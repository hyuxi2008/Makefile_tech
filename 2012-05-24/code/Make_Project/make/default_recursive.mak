#通过LIBDIR来判断是否已经包含过generic.mak，如果已经包含则不包含该文件，否则包含该文件。
ifeq "$(LIBDIR)" ""
include $(DVD_MAKE)/generic.mak
endif

#没有定义COMPILE_DIR则使用默认的方式编译所有目录，否则仅使用指定的编译目录。
COMPILE_DIR?= $(shell ls $(LS_FLG) | grep ^d |awk '{print $$8}' )

USEMODULES = $(COMPILE_DIR) 
#使用加前缀函数一定要注意避免和源码的文件名冲突，如使用:lib。此处使用libtemp_
ALLNAMELIB = $(addprefix libtemp_,$(addsuffix .a,$(USEMODULES)))	

all: $(ALLNAMELIB)

%.a :
	@$(MAKE) -C $(subst .a,,$(subst libtemp_,,$@))

#imodules:
#	@echo ""
#	@for i in $(COMPILE_DIR); do $(MAKE) -C $$i; done

#	@echo -e "\e[33m""#####################makeing $(shell pwd)#####################""\e[0m"

clean :
	-@for i in $(COMPILE_DIR); do $(MAKE) -C $$i clean; done
	-@rm  `find ./ -name *.o` -f
	-@rm  `find ./ -name *.a` -f
