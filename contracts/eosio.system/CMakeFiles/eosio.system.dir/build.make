# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.11.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.11.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/manhvu/mworks/git/eos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/manhvu/mworks/git/eos/build

# Utility rule file for eosio.system.

# Include the progress variables for this target.
include contracts/eosio.system/CMakeFiles/eosio.system.dir/progress.make

contracts/eosio.system/CMakeFiles/eosio.system: contracts/eosio.system/eosio.system.wast.hpp
contracts/eosio.system/CMakeFiles/eosio.system: contracts/eosio.system/eosio.system.abi.hpp
contracts/eosio.system/CMakeFiles/eosio.system: contracts/eosio.system/eosio.system.wasm


contracts/eosio.system/eosio.system.wast.hpp: contracts/eosio.system/eosio.system.wast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating eosio.system.wast.hpp"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && echo "const char* const eosio_system_wast = R\"=====(" > /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wast.hpp
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && cat /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wast >> /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wast.hpp
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && echo ")=====\";" >> /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wast.hpp

contracts/eosio.system/eosio.system.abi.hpp: contracts/eosio.system/eosio.system.abi
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating eosio.system.abi.hpp"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && echo "const char* const eosio_system_abi = R\"=====(" > /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.abi.hpp
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && cat /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.abi >> /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.abi.hpp
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && echo ")=====\";" >> /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.abi.hpp

contracts/eosio.system/eosio.system.wasm: contracts/eosio.system/eosio.system.wast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating WASM eosio.system.wasm"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && /Users/manhvu/mworks/git/eos/build/libraries/wasm-jit/Source/Programs/eosio-wast2wasm /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wast /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wasm -n

contracts/eosio.system/eosio.system.wast: contracts/eosio.system/eosio.system.s
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating WAST eosio.system.wast"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && /Users/manhvu/mworks/git/eos/build/externals/binaryen/bin/eosio-s2wasm -o /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/eosio.system.wast -s 10240 eosio.system.s

contracts/eosio.system/eosio.system.s: contracts/eosio.system/eosio.system.bc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating textual assembly eosio.system.s"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && /usr/local/wasm/bin/llc -thread-model=single -asm-verbose=false -o eosio.system.s eosio.system.bc

contracts/eosio.system/eosio.system.bc: contracts/eosio.system/eosio.system.cpp.bc
contracts/eosio.system/eosio.system.bc: contracts/libc++/libc++.bc
contracts/eosio.system/eosio.system.bc: contracts/musl/libc.bc
contracts/eosio.system/eosio.system.bc: contracts/eosiolib/eosiolib.bc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking LLVM bitcode executable eosio.system.bc"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && /usr/local/wasm/bin/llvm-link -only-needed -o eosio.system.bc eosio.system.cpp.bc /Users/manhvu/mworks/git/eos/build/contracts/libc++/libc++.bc /Users/manhvu/mworks/git/eos/build/contracts/musl/libc.bc /Users/manhvu/mworks/git/eos/build/contracts/eosiolib/eosiolib.bc

contracts/eosio.system/eosio.system.cpp.bc: ../contracts/eosio.system/eosio.system.cpp
contracts/eosio.system/eosio.system.cpp.bc: ../contracts/eosio.system/eosio.system.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/manhvu/mworks/git/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building LLVM bitcode eosio.system.cpp.bc"
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && /usr/local/wasm/bin/clang -emit-llvm -O3 --std=c++14 --target=wasm32 -ffreestanding -nostdlib -nostdlibinc -DBOOST_DISABLE_ASSERTS -DBOOST_EXCEPTION_DISABLE -fno-threadsafe-statics -fno-rtti -fno-exceptions -c /Users/manhvu/mworks/git/eos/contracts/eosio.system/eosio.system.cpp -o eosio.system.cpp.bc -Weverything -Wno-c++98-compat -Wno-old-style-cast -Wno-vla -Wno-vla-extension -Wno-c++98-compat-pedantic -Wno-missing-prototypes -Wno-missing-variable-declarations -Wno-packed -Wno-padded -Wno-c99-extensions -Wno-documentation-unknown-command -I /Users/manhvu/mworks/git/eos/contracts -I /Users/manhvu/mworks/git/eos/build/contracts -I /Users/manhvu/mworks/git/eos/externals/magic_get/include -isystem /Users/manhvu/mworks/git/eos/contracts/libc++/upstream/include -isystem /Users/manhvu/mworks/git/eos/contracts/musl/upstream/include -isystem /usr/local/include

eosio.system: contracts/eosio.system/CMakeFiles/eosio.system
eosio.system: contracts/eosio.system/eosio.system.wast.hpp
eosio.system: contracts/eosio.system/eosio.system.abi.hpp
eosio.system: contracts/eosio.system/eosio.system.wasm
eosio.system: contracts/eosio.system/eosio.system.wast
eosio.system: contracts/eosio.system/eosio.system.s
eosio.system: contracts/eosio.system/eosio.system.bc
eosio.system: contracts/eosio.system/eosio.system.cpp.bc
eosio.system: contracts/eosio.system/CMakeFiles/eosio.system.dir/build.make

.PHONY : eosio.system

# Rule to build all files generated by this target.
contracts/eosio.system/CMakeFiles/eosio.system.dir/build: eosio.system

.PHONY : contracts/eosio.system/CMakeFiles/eosio.system.dir/build

contracts/eosio.system/CMakeFiles/eosio.system.dir/clean:
	cd /Users/manhvu/mworks/git/eos/build/contracts/eosio.system && $(CMAKE_COMMAND) -P CMakeFiles/eosio.system.dir/cmake_clean.cmake
.PHONY : contracts/eosio.system/CMakeFiles/eosio.system.dir/clean

contracts/eosio.system/CMakeFiles/eosio.system.dir/depend:
	cd /Users/manhvu/mworks/git/eos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/manhvu/mworks/git/eos /Users/manhvu/mworks/git/eos/contracts/eosio.system /Users/manhvu/mworks/git/eos/build /Users/manhvu/mworks/git/eos/build/contracts/eosio.system /Users/manhvu/mworks/git/eos/build/contracts/eosio.system/CMakeFiles/eosio.system.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : contracts/eosio.system/CMakeFiles/eosio.system.dir/depend

