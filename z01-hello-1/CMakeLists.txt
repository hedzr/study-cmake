project(hello)

set(SRC_LIST main.cc ../z11-m1/libs/sm-lib/include/sm-lib/sm-lib.hh)

message(STATUS "This is BINARY dir " ${hello_BINARY_DIR})
message(STATUS "This is SOURCE dir " ${hello_SOURCE_DIR})
add_executable(${PROJECT_NAME} ${SRC_LIST})
