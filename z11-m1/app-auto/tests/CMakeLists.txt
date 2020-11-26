cmake_minimum_required(VERSION 3.5)
project(sm_lib_app_tests)

add_executable(${PROJECT_NAME}
        main.cc
        )

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        libs::sm-lib
        )

#add_test(sm_lib_tests ${PROJECT_NAME})

#get_property(tmp GLOBAL PROPERTY UNIT_TEST_TARGETS)
#set(tmp ${UNIT_TEST_TARGETS} ${PROJECT_NAME})
#set_property(GLOBAL PROPERTY UNIT_TEST_TARGETS "${tmp}")
#add_unit_test(sm_lib_tests ${PROJECT_NAME})