cmake_minimum_required(VERSION 3.9..3.19)
#cmake_minimum_required(VERSION 3.13)
#mark_as_advanced(CMAKE_BACKWARDS_COMPATIBILITY)
# saner control structure syntax
#set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)

set(CMAKE_SCRIPTS "cmake")
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/modules;${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS};${CMAKE_SOURCE_DIR};${CMAKE_MODULE_PATH}")
#list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/Modules:${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}")
#message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}") ###


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


# add_subdirectory(third-party/catch)
# add_subdirectory(src)
# add_subdirectory(test)

# add_library(study_cmake library.cxx library.h)

# add_subdirectory(z01-hello-1)
# add_subdirectory(z02-library-1)
# add_subdirectory(z03-library-2)
# add_subdirectory(z04-header-library)

debug_print_value(CMAKE_RUNTIME_OUTPUT_DIRECTORY)


#add_subdirectory(third-party/catch)
#add_subdirectory(src)
#add_subdirectory(test)

# add_library(study_cmake library.cxx library.h)

add_subdirectory(z01-hello-1)
add_subdirectory(z02-library-1)
add_subdirectory(z03-library-2)
add_subdirectory(z04-header-library)

add_subdirectory(z11-m1)
