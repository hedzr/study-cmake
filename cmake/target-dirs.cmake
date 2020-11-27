
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/bin")
set(LIBRARY_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/bin/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/test)

# Note that CMAKE_GENERATED_DIR is NOT a cmake builtin variable.
set(CMAKE_GENERATED_DIR "${CMAKE_BINARY_DIR}/generated")
mark_as_advanced(CMAKE_GENERATED_DIR)

message("   CMAKE_SOURCE_DIR:           ${CMAKE_SOURCE_DIR}")
message("   CMAKE_BINARY_DIR:           ${CMAKE_BINARY_DIR}")
message("   CMAKE_GENERATED_DIR:        ${CMAKE_GENERATED_DIR}")

#set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/sm-lib)
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/sm-lib)
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

#set(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/bin")
#set(LIBRARY_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/sm-lib")
#link_directories(BEFORE "${CMAKE_SOURCE_DIR}/sm-lib")


if (CMAKE_VERBOSE_DEBUG AND DEBUG)
  # Enable verbose output from Makefile builds.
  # This variable is a cache entry initialized (to FALSE) by the project() command. 
  # Users may enable the option in their local build tree to get more verbose 
  # output from Makefile builds and show each command line as it is launched.
  set(CMAKE_VERBOSE_MAKEFILE ON CACHE BOOL "ON")
  # Default value for POSITION_INDEPENDENT_CODE of targets.
  # This variable is used to initialize the POSITION_INDEPENDENT_CODE property 
  # on all the targets. See that target property for additional information. 
  # If set, it’s value is also used by the try_compile() command.
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif ()

#set(V alpha beta gamma)
#message(${V})
#
#foreach(i ${V})
#  message(${i})
#endforeach()
