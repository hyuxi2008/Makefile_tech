all:

command1:;@echo "1st command";echo "2nd command"
	@echo "3rd command"

command2:
	@echo "run in the same shell"
	@cd ..;ls

command3:
	@echo "run in different shell"
	@cd ..
	@ls

command_recusive1:
	@cd subdir&&make

command_recusive2:
	@make -C subdir

  NEW_VAR               =             1000             #new var define
print_newvar:
	@echo "$(NEW_VAR)"

print_curdir1:
	@echo "CUR_DIR_NAME = $(CUR_DIR_NAME1)"

CUR_DIR_NAME1 = $(notdir $(CUR_DIR_VAR1)) 
CUR_DIR_VAR1 = $(shell pwd)

print_curdir2:
	@echo "CUR_DIR_NAME = $(CUR_DIR_NAME2)"

#CUR_DIR_NAME2 = $(notdir $(CUR_DIR_VAR2)) 
CUR_DIR_NAME2 := $(notdir $(CUR_DIR_VAR2)) 
CUR_DIR_VAR2 := $(shell pwd)

