# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake3

# The command to remove a file.
RM = /usr/bin/cmake3 -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources

# Include any dependencies generated for this target.
include Exercise03/CMakeFiles/vadd03.dir/depend.make

# Include the progress variables for this target.
include Exercise03/CMakeFiles/vadd03.dir/progress.make

# Include the compile flags for this target's objects.
include Exercise03/CMakeFiles/vadd03.dir/flags.make

Exercise03/CMakeFiles/vadd03.dir/vadd.cpp.o: Exercise03/CMakeFiles/vadd03.dir/flags.make
Exercise03/CMakeFiles/vadd03.dir/vadd.cpp.o: Exercise03/vadd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Exercise03/CMakeFiles/vadd03.dir/vadd.cpp.o"
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 && /opt/rh/devtoolset-8/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vadd03.dir/vadd.cpp.o -c /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03/vadd.cpp

Exercise03/CMakeFiles/vadd03.dir/vadd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vadd03.dir/vadd.cpp.i"
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 && /opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03/vadd.cpp > CMakeFiles/vadd03.dir/vadd.cpp.i

Exercise03/CMakeFiles/vadd03.dir/vadd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vadd03.dir/vadd.cpp.s"
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 && /opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03/vadd.cpp -o CMakeFiles/vadd03.dir/vadd.cpp.s

# Object files for target vadd03
vadd03_OBJECTS = \
"CMakeFiles/vadd03.dir/vadd.cpp.o"

# External object files for target vadd03
vadd03_EXTERNAL_OBJECTS =

Exercise03/vadd03: Exercise03/CMakeFiles/vadd03.dir/vadd.cpp.o
Exercise03/vadd03: Exercise03/CMakeFiles/vadd03.dir/build.make
Exercise03/vadd03: /usr/lib64/libOpenCL.so
Exercise03/vadd03: Exercise03/CMakeFiles/vadd03.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable vadd03"
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vadd03.dir/link.txt --verbose=$(VERBOSE)
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 && /usr/bin/cmake3 -E copy_if_different /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03/vadd.cl /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03

# Rule to build all files generated by this target.
Exercise03/CMakeFiles/vadd03.dir/build: Exercise03/vadd03

.PHONY : Exercise03/CMakeFiles/vadd03.dir/build

Exercise03/CMakeFiles/vadd03.dir/clean:
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 && $(CMAKE_COMMAND) -P CMakeFiles/vadd03.dir/cmake_clean.cmake
.PHONY : Exercise03/CMakeFiles/vadd03.dir/clean

Exercise03/CMakeFiles/vadd03.dir/depend:
	cd /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03 /user/7/lavainnr/Documents/cours/DossierCommun/CalculGPU/Lab1-Sources/Exercise03/CMakeFiles/vadd03.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Exercise03/CMakeFiles/vadd03.dir/depend

