cmake_minimum_required(VERSION 3.8..3.13)

project(study-cmake VERSION 0.1.0
        DESCRIPTION "study for cmake"
        LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)


# macOS builtin cmake: /Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-3.13/Modules
# brew cmake:          $(brew --prefix cmake)/share/cmake/Modules
message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
set(CMAKE_SCRIPTS "cmake")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/Modules:${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}")
message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}") ###


include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/add-policies.cmake)
include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/detect-systems.cmake)
include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/target-dirs.cmake)
include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/utils.cmake)
include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/setup-build-env.cmake)


set(xVERSION_MAJOR 0)
set(xVERSION_MINOR 3)
set(xVERSION_MICRO 1)   # build number
set(xVERSION_PATCH 2)   # patch number
set(PROJECT_VERSION "${xVERSION_MAJOR}.${xVERSION_MINOR}.${xVERSION_MICRO}")
set(ARCHIVE_NAME ${CMAKE_PROJECT_NAME}-${PROJECT_VERSION})
set(xVERSION_IN ${CMAKE_SOURCE_DIR}/version.h.in)
include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/gen-versions.cmake)


include(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/info.cmake)


#add_subdirectory(third-party/catch)
#add_subdirectory(src)
#add_subdirectory(test)

# add_library(study_cmake library.cxx library.h)

add_subdirectory(z01-hello-1)
add_subdirectory(z02-library-1)
add_subdirectory(z03-library-2)
add_subdirectory(z04-header-library)

