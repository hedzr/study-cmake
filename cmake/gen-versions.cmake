

# https://github.com/pmirshad/cmake-with-git-metadata/blob/master/CMakeLists.txt

if (EXISTS "${CMAKE_SOURCE_DIR}/.git")
    execute_process(
            COMMAND git rev-parse --abbrev-ref HEAD
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE GIT_BRANCH
            OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    execute_process(
            COMMAND git log -1 --format=%h
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE GIT_COMMIT_HASH
            OUTPUT_STRIP_TRAILING_WHITESPACE
    )
else (EXISTS "${CMAKE_SOURCE_DIR}/.git")
    set(GIT_BRANCH "")
    set(GIT_COMMIT_HASH "")
endif (EXISTS "${CMAKE_SOURCE_DIR}/.git")

# get_git_head_revision(GIT_REFSPEC GIT_SHA1)
string(SUBSTRING "${GIT_COMMIT_HASH}" 0 12 GIT_REV)
if (NOT GIT_COMMIT_HASH)
  set(GIT_REV "0")
endif ()

message(STATUS "Git current branch: ${GIT_BRANCH}")
message(STATUS "Git commit hash:    ${GIT_COMMIT_HASH}")
message(STATUS "Git rev:            ${GIT_REV}")


message(STATUS "Generating version.h from ${xVERSION_IN} ...")
configure_file(
        ${xVERSION_IN}
        ${CMAKE_BINARY_DIR}/generated/version.h
)







