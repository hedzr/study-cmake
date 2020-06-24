
SET(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/bin")
SET(LIBRARY_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/lib")
LINK_DIRECTORIES(BEFORE "${CMAKE_SOURCE_DIR}/lib")



SET(CMAKE_VERBOSE_MAKEFILE ON CACHE BOOL "ON")
SET(CMAKE_POSITION_INDEPENDENT_CODE ON)


# FORCE gcc
#if (MACOS)
#    set(CMAKE_C_COMPILER "gcc-9")
#    set(CMAKE_CXX_COMPILER "g++-9")
#endif()
#message("CMAKE_C_COMPILER:        ${CMAKE_C_COMPILER}")
#message("CMAKE_CXX_COMPILER:      ${CMAKE_CXX_COMPILER}")
