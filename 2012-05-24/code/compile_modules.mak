#ͨ��LIBDIR���ж��Ƿ��Ѿ�������generic.mak������Ѿ������򲻰������ļ�������������ļ���
ifeq "$(LIBDIR)" ""
include $(DVD_MAKE)/generic.mak
endif

MODULE_NAME=$(shell pwd |sed 's/^\(.*\)[/]//' )
#û�ж���COMPILE_DIR��ʹ��Ĭ�ϵķ�ʽ��������Ŀ¼�������ʹ��ָ���ı���Ŀ¼��
COMPILE_DIR?= $(shell ls $(LS_FLG) | grep ^d |awk '{print $$8}' )

USEMODULES = $(COMPILE_DIR) 
USELIB = $(patsubst %,$(LIBDIR)/lib%.a,$(USEMODULES))
#ʹ�ü�ǰ׺����һ��Ҫע������Դ����ļ�����ͻ����ʹ��:lib���˴�ʹ��libtemp_
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


