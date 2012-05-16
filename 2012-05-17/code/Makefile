#MAKEFILELIST Var
MAKEFILELIST1 := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
include includefile
MAKEFILELIST2 := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))

#DEBUG/RELEASE
SOFTWARE_VERSION = DEBUG 
#SOFTWARE_VERSION = RELEASE

all:author_declare
	@echo "$(warning all target will generate!)"
	@echo "MAKEFILELIST1:$(MAKEFILELIST1)"
	@echo "MAKEFILELIST2:$(MAKEFILELIST2)"
	@echo "SDK_VER:$(SDK_VERSION)"
	@echo "AR:$(AR),CC:$(CC)"
	@echo "makefile it works"

author_declare:
ifeq "$(strip $(SOFTWARE_VERSION))" "DEBUG"
#ifeq "$(SOFTWARE_VERSION)" "DEBUG"
	@echo "makefile write by $(MAKEFILE_AUTHOR_NAME)"
	@echo "makefile author's email:$(MAKEFILE_AUTHOR_EMAIL)"
endif

#.VARIABLES var
testvariables:
	echo "$(.VARIABLES)"

#subst fun
SUBST_STR = code/program.c
substfun:
	@echo "origin SUBST_STR :$(SUBST_STR)"
	@echo "after subst      :$(subst code,/home/user/project/code,$(SUBST_STR))"

#patsubst fun
SRC_1 = code/app_init.c code/app_avplay_host.c code/app_test.c
OBJS_1 = $(patsubst %.c,%.o, $(SRC_1))
OBJS_2 = $(SRC_1:%.c=%.o)

patsubstfun:
	@echo "SRC_1 :$(SRC_1)"
	@echo "OBJS_1:$(OBJS_1)"
	@echo "OBJS_2:$(OBJS_2)"

#sort fun
SORT_OPT = -DDEBUG -D__LINUX__ -DDEBUG -DOVTPREVIEW=1

sortfun:
	@echo "SORT_OPT  :$(SORT_OPT)"
	@echo "after sort:$(sort $(SORT_OPT))"

#dir fun
FILENAME = default_ovtc.mak source/app_init.c 

dirfun:
	@echo "FILENAME:$(FILENAME)"
	@echo "dir     :$(dir $(FILENAME))"

#notdir fun
notdirfun:
	@echo "FILENAME:$(FILENAME)"
	@echo "notdir  :$(notdir $(FILENAME))"

#addsuffix & addprefix fun
SOURCE_FILE = app_init app_avplay_host app_test

addsuffixfun:
	@echo "SOURCE_FILE:$(SOURCE_FILE)"
	@echo "addsuffix  :$(addsuffix .c,$(SOURCE_FILE))" 

addprefixfun:addsuffixfun
	@echo "addprefix  :$(addprefix source/,$(addsuffix .c,$(SOURCE_FILE)))"
		
#wildcard fun
WILDCARD_SOURCE = $(wildcard source/*.c)

wildcardfun:
	@echo "WILDCARD_SOURCE:$(WILDCARD_SOURCE)"

#shell fun
LS_FILES = $(shell ls)

shellfun:
	@echo "LS_FILES:$(LS_FILES)"

#auto Var
autovar:default_ovtc.mak source/app_init.c source/app_test.c
	@echo "\$$@ = $@"
	@echo "$$< = $<"
	@echo "$$^ = $^"
	@echo "\$$? = $?"

