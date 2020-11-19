cmake_minimum_required(VERSION 3.13)
project(sm-app
        VERSION 1.0.0
        LANGUAGES CXX)

find_package(sm-lib REQUIRED)

## Create the executable target
add_executable(sm-app main.cc)
target_compile_features(sm-app PRIVATE cxx_std_11)
target_link_libraries(sm-app PRIVATE sm-lib::sm-lib)
