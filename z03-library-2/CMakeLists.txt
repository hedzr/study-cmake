project(library-2 C CXX)

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


message(STATUS "This is mucht-BINARY dir " ${library-2_BINARY_DIR})
message(STATUS "This is mucht-SOURCE dir " ${library-2_SOURCE_DIR})
message(STATUS "This is mucht-INCLUDE dir " ${CMAKE_CURRENT_SOURCE_DIR}/include)
message(STATUS "This is PROJECT_SOURCE_DIR dir " ${PROJECT_SOURCE_DIR})

debugValue(SC14R_INCS)


# The muchs library ---------------

# set(header_files ${CMAKE_CURRENT_SOURCE_DIR}/include/muchs/muchs.hh)
file(GLOB_RECURSE header_files ${CMAKE_CURRENT_SOURCE_DIR}/include/*.hh)
list(APPEND source_files library.cc)
# debugValue(source_files)
debugValue(header_files)

# library
add_library(mucht SHARED ${source_files} ${header_files})
target_include_directories(mucht PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_features(mucht PUBLIC cxx_std_11)
set_target_properties(mucht
        PROPERTIES
        CXX_STANDARD 11
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
        )


# The main program ---------------

# The sources shared between the main program and the tests
set(PROJECT_SOURCES main.cc)

add_executable(library-2-test-program ${PROJECT_SOURCES})
target_link_libraries(library-2-test-program PRIVATE mucht)

