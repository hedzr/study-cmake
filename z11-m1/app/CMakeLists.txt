cmake_minimum_required(VERSION 3.13)
project(sm-app
        VERSION 1.0.0
        LANGUAGES CXX)

find_package(sm-lib REQUIRED)

## Create the executable target
add_executable(${PROJECT_NAME} main.cc)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)
target_link_libraries(${PROJECT_NAME} PRIVATE sm-lib::sm-lib)
