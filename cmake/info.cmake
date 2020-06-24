# macOS builtin cmake: /Applications/CLion.app/Contents/bin/cmake/mac/share/cmake-3.13/Modules
# brew cmake:          $(brew --prefix cmake)/share/cmake/Modules



# ----------------------------------------------------------------------
# Information Summary
# ----------------------------------------------------------------------
# cmake info
message("------------------------------------------------------------------------")
message("CMAKE_BINARY_DIR:        ${CMAKE_BINARY_DIR}")
message("CMAKE_SYSTEM_NAME:       ${CMAKE_SYSTEM_NAME}")
message("CMAKE_SYSTEM_VERSION:    ${CMAKE_SYSTEM_VERSION}")
message("CMAKE_SYSTEM_PROCESSOR:  ${CMAKE_SYSTEM_PROCESSOR}")
message("CMAKE_C_COMPILER:        ${CMAKE_C_COMPILER}")
message("CMAKE_CXX_COMPILER:      ${CMAKE_CXX_COMPILER}")
message("CMAKE_BUILD_TYPE:        ${CMAKE_BUILD_TYPE}")

# project info
message("-------------------------")
message("PROJECT_VERSION:         ${PROJECT_VERSION}")
message("ARCHIVE_NAME:            ${ARCHIVE_NAME}")
message("-------------------------")
message("EXECUTABLE_OUTPUT_PATH:  ${EXECUTABLE_OUTPUT_PATH}")
message("LIBRARY_OUTPUT_PATH:     ${LIBRARY_OUTPUT_PATH}")

# dependency info
message("-------------------------")
message("SKIA:                    ${ENABLE_SKIA} -> ${USE_SKIA}")
message("CAIRO:                   ${ENABLE_CAIRO} -> ${USE_CAIRO}")
message("GLX:                     ${ENABLE_GLX} -> ${USE_GLX}")
message("EGL:                     ${ENABLE_EGL} -> ${USE_EGL}")
message("GLUT:                    ${ENABLE_GLUT} -> ${USE_GLUT}")
message("OPENGLES2:               ${OPENGLES2_FOUND}")
message("OPENGLES3:               ${OPENGLES3_FOUND}")
message("CAIROGLES:               ${ENABLE_CAIROGLES}")
message("CAIRO:                   ${CAIRO_INCLUDE_DIRS}")
message("SDL2:                    ${SDL2_INCLUDE_DIR} | libs: ${SDL2_LIBRARY}")
if (ENABLE_SKIA)
  message("SKIA:                    ${SKIA_INCLUDE_DIRS}")
endif()
message("X11:                     ${X11_LIBRARIES}")

message("-------------------------")
message("LIBS:")
foreach (lib ${C14R_LIBS})
  message("                         ${lib}")
endforeach (lib)
message("-------------------------")
message("INCLUDES:")
foreach (inc ${CMAKE_INCLUDES})
  message("                         ${inc}")
endforeach (inc)
message("INCLUDES (SYS):")
foreach (inc ${C14R_INCS_SYS})
  message("                         ${inc}")
endforeach (inc)
message("------------------------------------------------------------------------")

