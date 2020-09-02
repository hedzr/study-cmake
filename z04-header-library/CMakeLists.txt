project(library-3)

list(APPEND SC14R_INCS
        ${PROJECT_SOURCE_DIR}
        ${PROJECT_SOURCE_DIR}/include
        ${PROJECT_SOURCE_DIR}/src
        ${PROJECT_SOURCE_DIR}/src/include
        ${CMAKE_CURRENT_SOURCE_DIR}/include

        # Generated files
        ${CMAKE_BINARY_DIR}/generated

        # Generated includes
        ${CMAKE_BINARY_DIR}
        ${CMAKE_BINARY_DIR}/src
        )

include_directories(${SC14R_INCS})
include_directories(SYSTEM ${SC14R_INCS_SYS})

message(STATUS "This is monid-BINARY dir " ${library-3_BINARY_DIR})
message(STATUS "This is monid-SOURCE dir " ${library-3_SOURCE_DIR})
message(STATUS "This is monid-INCLUDE dir " ${CMAKE_CURRENT_SOURCE_DIR}/include)
message(STATUS "This is PROJECT_SOURCE_DIR dir " ${PROJECT_SOURCE_DIR})


# The monid library ---------------


#set(header_files ${CMAKE_CURRENT_SOURCE_DIR}/include/monid/*.hh)
file(GLOB_RECURSE header_files
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.hh
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.inl
        )

# Header only library, therefore INTERFACE
add_library(monid INTERFACE)


# INTERFACE targets only have INTERFACE properties
target_include_directories(monid INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${header_files}
        )
target_compile_features(monid INTERFACE cxx_std_11)


# The main program ---------------

# The sources shared between the main program and the tests
set(PROJECT_SOURCES main.cc)

add_executable(library-3-test-program ${PROJECT_SOURCES})
target_link_libraries(library-3-test-program PRIVATE monid)

