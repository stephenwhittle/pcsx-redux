##### imgui_core

add_library(imgui_core STATIC EXCLUDE_FROM_ALL)
target_sources(imgui_core PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/imgui/backends/imgui_impl_glfw.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/misc/cpp/imgui_stdlib.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/misc/freetype/imgui_freetype.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui_memory_editor/imgui_memory_editor.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_demo.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_draw.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_tables.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_widgets.cpp
)
target_include_directories(imgui_core PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/imgui
	${CMAKE_CURRENT_LIST_DIR}/imgui/backends
	${CMAKE_CURRENT_LIST_DIR}/imgui/examples
	${CMAKE_CURRENT_LIST_DIR}/imgui/misc/cpp
	${CMAKE_CURRENT_LIST_DIR}
)

target_compile_definitions(imgui_core PUBLIC -DNVG_NO_STB -DIMGUI_IMPL_OPENGL_LOADER_GL3W -DIMGUI_ENABLE_FREETYPE -DNOMINMAX)

if (MSVC)
	target_compile_options(imgui_core PRIVATE "/FI${PCSX_SRC_ROOT_DIR}/src/forced-includes/imgui.h"
	)
else()
	target_compile_options(imgui_core PRIVATE -include "${PCSX_SRC_ROOT_DIR}/src/forced-includes/imgui.h")
endif()

target_link_libraries(imgui_core PUBLIC freetype fmt glfw)


##### imgui_filedialog

add_library (imgui_filedialog STATIC EXCLUDE_FROM_ALL)
target_sources(imgui_filedialog PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/ImFileDialog/ImFileDialog.cpp
)

target_include_directories(imgui_filedialog PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/ImFileDialog
)

target_link_libraries(imgui_filedialog PUBLIC imgui_core)

##### imgui_md

add_library(imgui_md STATIC EXCLUDE_FROM_ALL)
target_sources(imgui_md PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/imgui_md/imgui_md.cpp
)
target_include_directories(imgui_md PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/imgui_md
)
target_link_libraries (imgui_md PUBLIC md4c imgui_core)