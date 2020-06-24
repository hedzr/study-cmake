cmake_minimum_required(VERSION 3.6)
project(study-cmake VERSION 0.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)


# macOS builtin cmake: /Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-3.13/Modules
# brew cmake:          $(brew --prefix cmake)/share/cmake/Modules
MESSAGE("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
SET(CMAKE_SCRIPTS "cmake")
LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/Modules:${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}")
MESSAGE("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}") ###



INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/add-policies.cmake)
INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/detect-systems.cmake)
INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/target-dirs.cmake)
INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/utils.cmake)
INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/setup-build-env.cmake)



SET(xVERSION_MAJOR 0)
SET(xVERSION_MINOR 3)
SET(xVERSION_MICRO 0)   # build number
SET(xVERSION_PATCH 0)   # patch number
SET(PROJECT_VERSION "${xVERSION_MAJOR}.${xVERSION_MINOR}.${xVERSION_MICRO}")
SET(ARCHIVE_NAME ${CMAKE_PROJECT_NAME}-${PROJECT_VERSION})
SET(xVERSION_IN ${CMAKE_SOURCE_DIR}/version.h.in)
INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/gen-versions.cmake)



INCLUDE(${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/info.cmake)





#add_subdirectory(third-party/catch)
#add_subdirectory(src)
#add_subdirectory(test)

# add_library(study_cmake library.cxx library.h)

add_subdirectory(z01-hello-1)
add_subdirectory(z02-library-1)
add_subdirectory(z03-library-2)
add_subdirectory(z04-header-library)

