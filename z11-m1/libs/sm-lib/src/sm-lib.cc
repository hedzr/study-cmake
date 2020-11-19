//
// Created by Hedzr Yeh on 2020/11/19.
//

#include "sm-lib/sm-lib.hh"

#include <string>
#include <stdexcept>
#include <iostream>
#include <iomanip>
#include <sstream>

#include <zlib.h>

std::string compress_string(const std::string &str, int compression_level) {
    z_stream zs;                        // z_stream is zlib's control structure
    memset(&zs, 0, sizeof(zs));

    if (deflateInit(&zs, compression_level) != Z_OK)
        throw (std::runtime_error("deflateInit failed while compressing."));

    zs.next_in = (Bytef *) str.data();
    zs.avail_in = str.size();           // set the z_stream's input

    int ret;
    char out_buffer[32768];
    std::string out_string;

    // retrieve the compressed bytes blockwise
    do {
        zs.next_out = reinterpret_cast<Bytef *>(out_buffer);
        zs.avail_out = sizeof(out_buffer);

        ret = deflate(&zs, Z_FINISH);

        if (out_string.size() < zs.total_out) {
            // append the block to the output string
            out_string.append(out_buffer,
                              zs.total_out - out_string.size());
        }
    } while (ret == Z_OK);

    deflateEnd(&zs);

    if (ret != Z_STREAM_END) {          // an error occurred that was not EOF
        std::ostringstream oss;
        oss << "Exception during zlib compression: (" << ret << ") " << zs.msg;
        throw (std::runtime_error(oss.str()));
    }

    return out_string;
}

std::string decompress_string(const std::string &str) {
    z_stream zs;                        // z_stream is zlib's control structure
    memset(&zs, 0, sizeof(zs));

    if (inflateInit(&zs) != Z_OK)
        throw (std::runtime_error("inflateInit failed while decompressing."));

    zs.next_in = (Bytef *) str.data();
    zs.avail_in = str.size();

    int ret;
    char outbuffer[32768];
    std::string outstring;

    // get the decompressed bytes blockwise using repeated calls to inflate
    do {
        zs.next_out = reinterpret_cast<Bytef *>(outbuffer);
        zs.avail_out = sizeof(outbuffer);

        ret = inflate(&zs, 0);

        if (outstring.size() < zs.total_out) {
            outstring.append(outbuffer,
                             zs.total_out - outstring.size());
        }

    } while (ret == Z_OK);

    inflateEnd(&zs);

    if (ret != Z_STREAM_END) {          // an error occurred that was not EOF
        std::ostringstream oss;
        oss << "Exception during zlib decompression: (" << ret << ") "
            << zs.msg;
        throw (std::runtime_error(oss.str()));
    }

    return outstring;
}
