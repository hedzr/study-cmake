//
// Created by Hedzr Yeh on 2020/11/19.
//

#include <iostream>
#include <sm-lib/sm-lib.hh>

#if JUST_FOR_REFERRING
int main(int, char **) {
    std::cout << "Running tests...\n";

    std::string input = "tests and strings";
    std::string cstr = compress_string(input);
    if (cstr != "bad one") {
        return 1;
    }
    
    std::string dstr = decompress_string(cstr);

    return dstr == cstr ? 0 : 1;
}
#endif


int main(int, char **) {
    std::cout << "Running tests...\n";

    std::string input = "tests and strings";
    std::string cstr = compress_string(input);
    if (cstr != "bad one") {
        std::cerr << "PRB\n";
        return 1;
    }

    std::string dstr = decompress_string(cstr);

    return dstr == cstr ? 0 : 1;
}