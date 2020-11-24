cmake_minimum_required(VERSION 3.9..3.19)
set(CMAKE_SCRIPTS "cmake")
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/modules;${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS};${CMAKE_SOURCE_DIR};${CMAKE_MODULE_PATH}")
include(prerequisites)
include(version-def)
include(add-policies)     # ${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/
include(detect-systems)
include(target-dirs)
include(utils)


project(study-cmake
        VERSION ${VERSION}
        DESCRIPTION "study for cmake"
        LANGUAGES C CXX)

include(cxx-standard-def)
include(cxx-detect-compilers)
include(setup-build-env)
include(versions-gen)

debug_print_top_vars()
# debug_print_value(CMAKE_RUNTIME_OUTPUT_DIRECTORY)


# add_subdirectory(third-party/catch)
# add_subdirectory(src)
# add_subdirectory(test)
#
# add_library(study_cmake library.cxx library.h)


# Classical CMake style
add_subdirectory(z01-hello-1)
add_subdirectory(z02-library-1)
add_subdirectory(z03-library-2)
add_subdirectory(z04-header-library)

# Modern CMake samples. The first is m1:
add_subdirectory(z11-m1)
