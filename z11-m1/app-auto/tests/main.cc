//
// Created by Hedzr Yeh on 2020/11/19.
//

#include <iostream>
#include <vector>
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
    std::cout << "Running tests..." << std::endl;

    std::string input = "tests and strings";
    std::string cstr = compress_string(input);

    //    if (cstr != "bad one") {
    //        std::cerr << "PRB\n";
    //        return 1;
    //    }

    std::string dstr = decompress_string(cstr);

    auto *v = new std::vector<int>();
    v->push_back(1);
    v->push_back(2);
    v->push_back(3);
    v->push_back(4);
    
    int ret = dstr == input ? 0 : 1;
    std::cout << "return " << ret << std::endl;
    return ret;
}