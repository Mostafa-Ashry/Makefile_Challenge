cc=gcc
source_path=./Src
include_path=./Inc
depence_path=.\Dependencies
vpath %.c ./Src
vpath %.h ./Inc
link_target = app.exe

# To get a list of all the C source files in a directory
source_files=$(subst $(source_path)/,,$(wildcard $(source_path)/*.c)) 
object_files1 = $(source_files:.c=.o)    
object_files2 = AbdelQader_MostafaMohamedAshry_Moawaed_Mariam.o 
depence_files = $(source_files:.c=.d)
depence_files2 = $(addprefix $(depence_path)\,$(depence_files))
clean_files = $(object_files1) $(link_target) $(depence_files2)

# pull in dependency info for *existing* .o files
-include $(depence_files2)

clean :
	del $(clean_files)
	# compile
%.o : %.c
	$(cc) -c -I$(include_path) $< -o $@
	$(cc) -MMD -I$(include_path) $< > $(depence_path)\$*.d

# link
$(link_target) : $(object_files1) $(object_files2) #$(depence_files2)
	$(cc) $^ -o $@

all : $(link_target)