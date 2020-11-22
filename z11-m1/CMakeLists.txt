cmake_minimum_required(VERSION 3.5..3.19)
set(CMAKE_SCRIPTS "../cmake")
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/modules;${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS};${CMAKE_SOURCE_DIR};${CMAKE_SOURCE_DIR}/..;${CMAKE_MODULE_PATH}")
include(.version)
include(add-policies)     # ${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/
include(detect-systems)
#include(target-dirs)
include(utils)


project(z11-m1)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_subdirectory(libs/sm-lib)
add_subdirectory(app-auto)
# add_subdirectory(app)
