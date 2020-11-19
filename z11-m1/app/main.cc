//
// Created by Hedzr Yeh on 2020/11/19.
//

#include <string>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <stdexcept>
#include "sm-lib/sm-lib.hh"

// from https://panthema.net/2007/0328-ZLibString.html
int main(int argc, char* argv[])
{
    std::string allinput;

    while (std::cin.good())     // read all input from cin
    {
        char inbuffer[32768];
        std::cin.read(inbuffer, sizeof(inbuffer));
        allinput.append(inbuffer, std::cin.gcount());
    }

    if (argc >= 2 && strcmp(argv[1], "-d") == 0)
    {
        std::string cstr = decompress_string( allinput );

        std::cerr << "Inflated data: "
                  << allinput.size() << " -> " << cstr.size()
                  << " (" << std::setprecision(1) << std::fixed
                  << ( ((float)cstr.size() / (float)allinput.size() - 1.0) * 100.0 )
                  << "% increase).\n";

        std::cout << cstr;
    }
    else
    {
        std::string cstr = compress_string( allinput );

        std::cerr << "Deflated data: "
                  << allinput.size() << " -> " << cstr.size()
                  << " (" << std::setprecision(1) << std::fixed
                  << ( (1.0 - (float)cstr.size() / (float)allinput.size()) * 100.0)
                  << "% saved).\n";

        std::cout << cstr;
    }
}
