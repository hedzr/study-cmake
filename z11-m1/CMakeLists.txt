cmake_minimum_required(VERSION 3.5..3.19)
set(CMAKE_SCRIPTS "cmake")
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/modules;${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS};${CMAKE_SOURCE_DIR};${CMAKE_SOURCE_DIR}/..;${CMAKE_MODULE_PATH}")
include(prerequisites)
include(version-def)
include(add-policies)
include(detect-systems)
include(target-dirs)
include(utils)


project(z11-m1)

include(cxx-standard-def)


add_subdirectory(libs)
add_subdirectory(app-auto)
# add_subdirectory(app)
