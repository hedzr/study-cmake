cmake_minimum_required(VERSION 3.5)
project(sm-lib VERSION 1.0.0 LANGUAGES CXX)
find_package(ZLIB REQUIRED)

#if ( ZLIB_FOUND )
#    include_directories( ${ZLIB_INCLUDE_DIRS} )
#    target_link_libraries( YourProject ${ZLIB_LIBRARIES} )
#endif( ZLIB_FOUND )

#if (ZLIB_FOUND)
#    debug_print_value(ZLIB_INCLUDE_DIRS)
#    debug_print_value(ZLIB_LIBRARIES)
#endif ()

if (POLICY CMP0069)
    cmake_policy(SET CMP0069 NEW)
endif ()

#
# A Target:
#
add_library(${PROJECT_NAME})
add_library(libs::${PROJECT_NAME} ALIAS ${PROJECT_NAME})
cxx_set_ipo(${PROJECT_NAME})
set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "libs/${PROJECT_NAME}")

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)
target_sources(${PROJECT_NAME} PRIVATE src/${PROJECT_NAME}.cc)
target_link_libraries(${PROJECT_NAME} PRIVATE ${ZLIB_LIBRARIES})
#set_target_properties(${PROJECT_NAME} PROPERTIES
#        COMPILE_FEATURES cxx_std_14
#        SOURCES src/${PROJECT_NAME}.cc
#        )
target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
        PRIVATE
        ${ZLIB_INCLUDE_DIRS}
        )

#
# for debugging
#
file(GENERATE OUTPUT ${CMAKE_BINARY_DIR}/generated/abc.log CONTENT
        "-I$<JOIN:$<TARGET_PROPERTY:${PROJECT_NAME},INCLUDE_DIRECTORIES>, -I>"
        # "$<TARGET_FILE:${PROJECT_NAME}>"
        # "$<INSTALL_INTERFACE:include> - $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        )
#add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E echo
#        ">> INSTALL_INTERFACE \$<INSTALL_INTERFACE:include> = $<INSTALL_INTERFACE:include>")

#
# for Testing
#

if (BUILD_TESTING)
    # add_subdirectory(tests)
#    add_unit_test(${PROJECT_NAME} tests sm_lib_tests)
endif ()
debug_print_value(CPU_ARCH)

#
# for Installing
#

# Must use GNUInstallDirs to install libraries into correct locations on all platforms.
include(GNUInstallDirs)
foreach (dir
        BINDIR
        SBINDIR
        LIBEXECDIR
        SYSCONFDIR
        SHAREDSTATEDIR
        LOCALSTATEDIR
        RUNSTATEDIR
        LIBDIR
        INCLUDEDIR
        OLDINCLUDEDIR
        DATAROOTDIR
        DATADIR
        INFODIR
        LOCALEDIR
        MANDIR
        DOCDIR
        )
    # GNUInstallDirs_get_absolute_install_dir(CMAKE_INSTALL_FULL_${dir} CMAKE_INSTALL_${dir})
    debug_print_value(CMAKE_INSTALL_FULL_${dir})
endforeach ()
#debug_print_value(
#        CMAKE_INSTALL_LIBDIR
#)
#message("${CMAKE_INSTALL_LIBDIR}")

install(TARGETS ${PROJECT_NAME}
        EXPORT ${PROJECT_NAME}Targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )

install(EXPORT ${PROJECT_NAME}Targets
        FILE ${PROJECT_NAME}Targets.cmake
        NAMESPACE ${PROJECT_NAME}::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

install(DIRECTORY include/${PROJECT_NAME}
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )

install(FILES
        ${CMAKE_CURRENT_LIST_DIR}/cmake/${PROJECT_NAME}Config.cmake
        DESTINATION
        ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

debug_dump_target_inc_dirs(${PROJECT_NAME})
