//
// Created by Hedzr Yeh on 2020/11/19.
//

#ifndef STUDY_CMAKE_SM_LIB_HH
#define STUDY_CMAKE_SM_LIB_HH

#include <string>
#include <zlib.h>

/** Compress a STL string using zlib with given compression level and return
  * the binary data. */
std::string compress_string(const std::string &str, int compression_level = Z_BEST_COMPRESSION);

/** Decompress an STL string using zlib and return the original data. */
std::string decompress_string(const std::string &str);


#endif //STUDY_CMAKE_SM_LIB_HH
