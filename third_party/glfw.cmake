include(FetchContent)
FetchContent_Declare(
	glfw
	GIT_REPOSITORY  https://github.com/glfw/glfw.git
    GIT_TAG         "master"
    SOURCE_DIR      "${CMAKE_CURRENT_BINARY_DIR}/glfw"
    GIT_SHALLOW     TRUE
	FIND_PACKAGE_ARGS
)

FetchContent_MakeAvailable(glfw)