#ͨ��LIBDIR���ж��Ƿ��Ѿ�������generic.mak������Ѿ������򲻰������ļ�������������ļ���
ifeq "$(LIBDIR)" ""
include $(DVD_MAKE)/generic.mak
endif

# defined flags
CFG_INC += -I ./include
LIBNAME = $(shell pwd |sed 's/^\(.*\)[/]//' )
SRC += $(wildcard code/*.c)
SRC +=$(wildcard code/*.cpp)
OBJS=$(patsubst %.cpp,%.o,$(patsubst %.c,%.o,$(SRC)))
SLIB=$(LIB_PREFIX)$(LIBNAME).a
#depend=$(SRC:.c=.d)
depend=$(patsubst %.cpp,%.d,$(patsubst %.c,%.d,$(SRC)))	

all: $(SLIB)

$(SLIB): ${OBJS}
	@echo "----make $(SLIB) to $(LIBDIR)----"
	@$(AR) -rc -o $@ $(OBJS)
	-@mv $(SLIB) $(LIBDIR)
	-@rm>$(NULL) $(depend) -f

#-include $(depend)

#%.d: %.c
#	@$(CC) $(CFG_INC) -M $^  > $@

%.o : %.c
	$(CC) -c -fPIC -o $@ $< $(PLATFORM_INC) $(CFG_INC) $(PLATFORM_OPT) $(CFG_OPT) 
#	-@rm $(patsubst %.o,%.d,$@)

#%.d: %.cpp
#	@$(CC) $(CFG_INC) -M $^  > $@

%.o : %.cpp
	$(CC) -c -fPIC -o $@ $< $(PLATFORM_INC) $(CFG_INC) $(PLATFORM_OPT) $(CFG_OPT) 
#	-@rm $(patsubst %.o,%.d,$@)

clean:
	-@rm>$(NULL) -f $(OBJS) $(SLIB) $(LIBDIR)/$(SLIB)
	-@rm>$(NULL) -f $(depend)

