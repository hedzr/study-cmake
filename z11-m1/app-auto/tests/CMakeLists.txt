cmake_minimum_required(VERSION 3.5)
project(sm_lib_app_tests)

add_executable(${PROJECT_NAME}
        main.cc
        )

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        libs::sm-lib
        )
