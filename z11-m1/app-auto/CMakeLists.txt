cmake_minimum_required(VERSION 3.13)
project(sm-app-auto
        VERSION 1.0.0
        LANGUAGES CXX)

## Create the executable target
add_executable(${PROJECT_NAME} main.cc)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)
target_link_libraries(${PROJECT_NAME}
        PRIVATE
        libs::sm-lib)

if (BUILD_TESTING)
    add_unit_test(${PROJECT_NAME} tests sm_lib_app_tests)
endif ()
