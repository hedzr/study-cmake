
#cmake_minimum_required(VERSION 3.13)
#mark_as_advanced(CMAKE_BACKWARDS_COMPATIBILITY)

# saner control structure syntax
set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)


#list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/Modules:${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}")
#message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}") ###

# this feature has been moved to cxx-detect-compilers.cmake
# set(CMAKE_POSITION_INDEPENDENT_CODE ON)

#
# set(CMAKE_VERBOSE_MAKEFILE ON)

# for compiling
option(ENABLE_CCACHE "enable ccache optimizations" ON)
if (ENABLE_CCACHE)
  find_program(CCACHE_PROGRAM ccache)
  if (CCACHE_PROGRAM)
    message(STATUS "Set up ccache ...")
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
  endif ()
endif ()

# for testing
set(ENV{CTEST_OUTPUT_ON_FAILURE} 1)
set_property(GLOBAL PROPERTY UNIT_TEST_TARGETS)
mark_as_advanced(UNIT_TEST_TARGETS)
enable_testing()
# include(CTest)

# for installing
#include(GNUInstallDirs)
