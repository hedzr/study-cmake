## Get the directory path of the <target>.cmake file
## get_filename_component(SM_LIB_CMAKE_DIR "sm-libConfig.cmake" DIRECTORY)

## Add the dependencies of our library
include(CMakeFindDependencyMacro)
find_dependency(ZLIB REQUIRED)

## Import the targets
if (NOT TARGET sm-lib::sm-lib)
  #include("${SM_LIB_CMAKE_DIR}/sm-libTargets.cmake")
  include("${CMAKE_CURRENT_LIST_DIR}/sm-libTargets.cmake")
endif ()