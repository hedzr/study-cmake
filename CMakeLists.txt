cmake_minimum_required(VERSION 3.8..3.13)
#mark_as_advanced(CMAKE_BACKWARDS_COMPATIBILITY)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)

# saner control structure syntax
SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)

# macOS builtin cmake: /Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-3.13/Modules
#  ll '/Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-3.17/Modules/Find*'
# brew cmake:          $(brew --prefix cmake)/share/cmake/Modules
message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
set(CMAKE_SCRIPTS "cmake")
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/modules;${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS};${CMAKE_MODULE_PATH}")
#list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/Modules:${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}")
message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}") ###


project(study-cmake
        VERSION 0.3.1.2
        DESCRIPTION "study for cmake"
        LANGUAGES C CXX)


set(ARCHIVE_NAME ${CMAKE_PROJECT_NAME}-${PROJECT_VERSION})
set(xVERSION_IN ${CMAKE_SOURCE_DIR}/version.h.in)
include(gen-versions)
include(add-policies)     # ${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/
include(detect-systems)
include(target-dirs)
include(utils)
include(setup-build-env)
include(info)


#add_subdirectory(third-party/catch)
#add_subdirectory(src)
#add_subdirectory(test)

# add_library(study_cmake library.cxx library.h)

add_subdirectory(z01-hello-1)
add_subdirectory(z02-library-1)
add_subdirectory(z03-library-2)
add_subdirectory(z04-header-library)

