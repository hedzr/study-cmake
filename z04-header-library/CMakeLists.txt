project(library-4)

list(APPEND SC14R_INCS
        ${PROJECT_SOURCE_DIR}
        ${PROJECT_SOURCE_DIR}/include
        ${PROJECT_SOURCE_DIR}/include.3rd
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

message(STATUS "This is monid-BINARY dir " ${library-4_BINARY_DIR})
message(STATUS "This is monid-SOURCE dir " ${library-4_SOURCE_DIR})
message(STATUS "This is monid-INCLUDE dir " ${CMAKE_CURRENT_SOURCE_DIR}/include)
message(STATUS "This is PROJECT_SOURCE_DIR dir " ${PROJECT_SOURCE_DIR})


# The monid library ---------------


set(header_files ${PROJECT_SOURCE_DIR}/include/monid/*.h)
#file(GLOB_RECURSE header_files
#        ${PROJECT_SOURCE_DIR}/include/*.h
#        ${PROJECT_SOURCE_DIR}/include/*.hh
#        ${PROJECT_SOURCE_DIR}/include/*.hpp
#        ${PROJECT_SOURCE_DIR}/include/*.hxx
#        ${PROJECT_SOURCE_DIR}/include/*.inl
#        )

# Header only library, therefore INTERFACE
add_library(monid INTERFACE)
debug_print_value(SC14R_INCS)

# INTERFACE targets only have INTERFACE properties
target_include_directories(monid 
        INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${PROJECT_SOURCE_DIR}/include
        )
target_compile_features(monid INTERFACE cxx_std_11)


# The main program ---------------

# The sources shared between the main program and the tests
set(PROJECT_SOURCES main.cc)

add_executable(library-4-test-program ${PROJECT_SOURCES})
target_link_libraries(library-4-test-program PRIVATE monid)

