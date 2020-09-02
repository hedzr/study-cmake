
# Set policies
# https://www.mankier.com/7/cmake-policies

# CMake Warning (dev) at CMakeLists.txt:5 (ADD_EXECUTABLE):
# Policy CMP0049 is not set: Do not expand variables in target source
# entries.  Run "cmake --help-policy CMP0049" for policy details.  Use the
# cmake_policy command to set the policy and suppress this warning.
IF(POLICY CMP0049)
  cmake_policy(SET CMP0049 NEW)
ENDIF()

cmake_policy(SET CMP0054 NEW) # ENABLE CMP0054: Only interpret if() arguments as variables or keywords when unquoted.
cmake_policy(SET CMP0042 NEW) # ENABLE CMP0042: MACOSX_RPATH is enabled by default.
cmake_policy(SET CMP0063 NEW) # ENABLE CMP0063: Honor visibility properties for all target types.
cmake_policy(SET CMP0077 NEW) # ENABLE CMP0077: option() honors normal variables

IF (POLICY CMP0068)
  cmake_policy(SET CMP0068 NEW)
ENDIF ()

if(${CMAKE_VERSION} VERSION_LESS 3.12)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()
