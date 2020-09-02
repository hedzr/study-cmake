project(hello)

set(SRC_LIST main.cc)

message(STATUS "This is BINARY dir " ${hello_BINARY_DIR})
message(STATUS "This is SOURCE dir " ${hello_SOURCE_DIR})
add_executable(hello ${SRC_LIST})
