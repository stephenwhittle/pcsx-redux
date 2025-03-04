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

set_target_properties(glfw PROPERTIES FOLDER "third_party")
set_target_properties(update_mappings PROPERTIES FOLDER "third_party")