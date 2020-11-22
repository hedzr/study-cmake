//
// Created by Hedzr Yeh on 2020/11/19.
//

#include <iostream>
#include <sm-lib/sm-lib.hh>

int main(int, char **) {
    std::cout << "Running tests...\n";

    std::string input = "tests and strings";
    std::string cstr = compress_string(input);
    std::string dstr = decompress_string(cstr);

    return dstr == cstr ? 0 : 1;
}
