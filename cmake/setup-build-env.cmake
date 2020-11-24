
set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE
          STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
          "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

if (MSVC)
  # warning level 4 and all warnings as errors
  add_compile_options(/W4 /WX)
else ()
  # lots of warnings and all warnings as errors
  add_compile_options(-Wall -Wextra -pedantic -Werror)
endif ()

#
#
