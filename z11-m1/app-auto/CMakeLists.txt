cmake_minimum_required(VERSION 3.13)
project(sm-app-auto
        VERSION 1.0.0
        LANGUAGES CXX)

## Create the executable target
add_executable(sm-app-auto main.cc)
target_compile_features(sm-app-auto PRIVATE cxx_std_11)
target_link_libraries(sm-app-auto
        PRIVATE
        libs::sm-lib)
