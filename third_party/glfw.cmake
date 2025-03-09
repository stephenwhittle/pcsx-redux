include(FetchContent)

set(GLFW_BUILD_DOCS OFF)
set(GLFW_INSTALL OFF)

FetchContent_Declare(
	glfw
	GIT_REPOSITORY  https://github.com/glfw/glfw.git
    GIT_TAG         "master"
    SOURCE_DIR      "${CMAKE_CURRENT_BINARY_DIR}/glfw"
    GIT_SHALLOW     TRUE
	FIND_PACKAGE_ARGS
)

FetchContent_MakeAvailable(glfw)

# hack because the GLFW CMake implementation hardcodes a folder value we dont want
set_target_properties(glfw PROPERTIES FOLDER "third_party/gl")
set_target_properties(update_mappings PROPERTIES FOLDER "third_party/gl")