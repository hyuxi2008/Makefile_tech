#ͨ��LIBDIR���ж��Ƿ��Ѿ�������generic.mak������Ѿ������򲻰������ļ�������������ļ���
ifeq "$(LIBDIR)" ""
include $(DVD_MAKE)/generic.mak
endif

#û�ж���COMPILE_DIR��ʹ��Ĭ�ϵķ�ʽ��������Ŀ¼�������ʹ��ָ���ı���Ŀ¼��
COMPILE_DIR?= $(shell ls $(LS_FLG) | grep ^d |awk '{print $$8}' )

USEMODULES = $(COMPILE_DIR) 
#ʹ�ü�ǰ׺����һ��Ҫע������Դ����ļ�����ͻ����ʹ��:lib���˴�ʹ��libtemp_
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
