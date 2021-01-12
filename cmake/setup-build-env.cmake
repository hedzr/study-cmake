
# FORCE gcc
#if (MACOS)
#    set(CMAKE_C_COMPILER "gcc-9")
#    set(CMAKE_CXX_COMPILER "g++-9")
#endif()
#message("CMAKE_C_COMPILER:        ${CMAKE_C_COMPILER}")
#message("CMAKE_CXX_COMPILER:      ${CMAKE_CXX_COMPILER}")


#set(default_build_type "Release")
#if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
#  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
#  set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE STRING "Choose the type of build." FORCE)
#  # Set the possible values of build type for cmake-gui
#  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
#endif()

if (MSVC)
  # warning level 4 and all warnings as errors
  add_compile_options(/W4 /WX)
  if (DEBUG)
    add_compile_options(-D_DEBUG)
  else()
    add_compile_options(-DNDEBUG)
  endif ()
else ()
  # lots of warnings and all warnings as errors
  add_compile_options(-Wall -Wextra -pedantic -Werror)
endif ()

if (MinGW)
  # try solving multiple definition error for MinGW
  add_compile_options(-D__USE_MINGW_ANSI_STDIO=0)
  if (DEBUG)
    add_compile_options(-D_DEBUG)
  else()
    add_compile_options(-DNDEBUG)
  endif ()
  add_link_options(--allow-multiple-definition)
endif ()

#
#
