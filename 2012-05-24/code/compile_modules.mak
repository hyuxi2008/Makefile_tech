#通过LIBDIR来判断是否已经包含过generic.mak，如果已经包含则不包含该文件，否则包含该文件。
ifeq "$(LIBDIR)" ""
include $(DVD_MAKE)/generic.mak
endif

MODULE_NAME=$(shell pwd |sed 's/^\(.*\)[/]//' )
#没有定义COMPILE_DIR则使用默认的方式编译所有目录，否则仅使用指定的编译目录。
COMPILE_DIR?= $(shell ls $(LS_FLG) | grep ^d |awk '{print $$8}' )

USEMODULES = $(COMPILE_DIR) 
USELIB = $(patsubst %,$(LIBDIR)/lib%.a,$(USEMODULES))
#使用加前缀函数一定要注意避免和源码的文件名冲突，如使用:lib。此处使用libtemp_
ALLNAMELIB = $(addprefix libtemp_,$(addsuffix .a,$(USEMODULES)))	

all: extract_lib create_lib

create_lib:
	@$(MAKE) unity_lib
	@rm $(USELIB) -f

extract_lib: $(ALLNAMELIB)
	@for i in $(USELIB); do $(AR) -x $$i ; done

unity_lib: lib$(MODULE_NAME).lib
	@rm $(wildcard *.o) -f
	mv  lib$(MODULE_NAME).lib $(LIBDIR)/lib$(MODULE_NAME).a -f
	
%.a :
	@$(MAKE) -C $(subst .a,,$(subst libtemp_,,$@))

lib$(MODULE_NAME).lib:
	$(AR) -rcs -o lib$(MODULE_NAME).lib $(wildcard *.o)

#imodules:
#	@echo ""
#	@for i in $(COMPILE_DIR); do $(MAKE) -C $$i; done

#	@echo -e "\e[33m""#####################makeing $(shell pwd)#####################""\e[0m"
clean :
	-@rm $(LIBDIR)/lib$(MODULE_NAME).lib -f
	-@rm  `find ./ -name *.o` -f
	-@rm  `find ./ -name *.a` -f


