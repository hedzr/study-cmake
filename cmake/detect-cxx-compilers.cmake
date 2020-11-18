
# https://cmake.org/cmake/help/latest/module/WriteCompilerDetectionHeader.html
# include(WriteCompilerDetectionHeader)
# https://cmake.org/cmake/help/v3.14/manual/cmake-compile-features.7.html#manual:cmake-compile-features(7)
set(WriterCompilerDetectionHeaderFound NOTFOUND)
# This module is only available with CMake >=3.1, so check whether it could be found
# BUT in CMake 3.1 this module doesn't recognize AppleClang as compiler, so just use it as of CMake 3.2
if (${CMAKE_VERSION} VERSION_GREATER "3.2")
  include(WriteCompilerDetectionHeader OPTIONAL RESULT_VARIABLE WriterCompilerDetectionHeaderFound)
endif ()
if (WriterCompilerDetectionHeaderFound)
  write_compiler_detection_header(
          FILE the-compiler.h
          #PREFIX The
          COMPILERS GNU Clang MSVC Intel  # AppleClang SunPro
          FEATURES cxx_variadic_templates
  )
endif ()
