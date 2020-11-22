cmake_minimum_required(VERSION 3.5)
project(sm_lib_tests)

add_executable(${PROJECT_NAME}
        main.cc
        )

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        libs::sm-lib
        )

add_test(sm_lib_tests ${PROJECT_NAME})