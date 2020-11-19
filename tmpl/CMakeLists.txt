project(hello
        VERSION ${CMAKE_PROJECT_VERSION}
        DESCRIPTION "att language"
        LANGUAGES C CXX)

set(ARCHIVE_NAME ${CMAKE_PROJECT_NAME}-${PROJECT_VERSION})
#set(xVERSION_IN ${CMAKE_SOURCE_DIR}/${CMAKE_SCRIPTS}/version.h.in)
#include(gen-versions)
#debug_print_project_vars()

####################################

include_directories(
        #${FLEX_INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../include
        ${CMAKE_CURRENT_SOURCE_DIR}/../../include

        ${CMAKE_CURRENT_BINARY_DIR}

        ${CMAKE_BINARY_DIR}/generated

        # Generated includes
        #${CMAKE_BINARY_DIR}
        #${CMAKE_BINARY_DIR}/src

        ${CMAKE_SOURCE_DIR}/include
)

dump_list(INCLUDE_DIRECTORIES)

#debug_print_hbar()
#debug_dump_cmake_environments()
#debug_print_hbar()
#debug_dump_cmake_variables()
#debug_print_hbar_long()

add_executable(hello main.cpp)
#with_ipo_supports(app1)
