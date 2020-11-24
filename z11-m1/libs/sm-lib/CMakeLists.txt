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

#
# A Target:
#
add_library(${PROJECT_NAME})
add_library(libs::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)
target_sources(${PROJECT_NAME} PRIVATE src/${PROJECT_NAME}.cc)
target_link_libraries(${PROJECT_NAME} PRIVATE ${ZLIB_LIBRARIES})
#set_target_properties(${PROJECT_NAME} PROPERTIES
#        COMPILE_FEATURES cxx_std_14
#        SOURCES src/${PROJECT_NAME}.cc
#        )
target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        PRIVATE
        ${ZLIB_INCLUDE_DIRS}
        )


#
# Testing
#

if (BUILD_TESTING)
    message("tests enabled")
    add_subdirectory(tests)
endif ()

#
# Installing
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
