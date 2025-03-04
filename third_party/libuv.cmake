include(FetchContent)

set(LIBUV_BUILD_SHARED OFF)

FetchContent_Declare(
	libuv
	GIT_REPOSITORY  https://github.com/libuv/libuv.git
    GIT_TAG         "v1.x"
    SOURCE_DIR      "${CMAKE_CURRENT_BINARY_DIR}/libuv"
    GIT_SHALLOW     TRUE
	FIND_PACKAGE_ARGS
)

FetchContent_MakeAvailable(libuv)