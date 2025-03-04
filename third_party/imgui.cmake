add_library(imgui STATIC EXCLUDE_FROM_ALL)
target_sources(imgui PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/imgui/backends/imgui_impl_glfw.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/misc/cpp/imgui_stdlib.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/misc/freetype/imgui_freetype.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui_md/imgui_md.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui_memory_editor/imgui_memory_editor.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_demo.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_draw.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_tables.cpp
	${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_widgets.cpp
)
target_include_directories(imgui PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/imgui
	${CMAKE_CURRENT_LIST_DIR}/imgui/backends
	${CMAKE_CURRENT_LIST_DIR}/imgui/examples
	${CMAKE_CURRENT_LIST_DIR}/imgui/misc/cpp
)
target_include_directories(imgui PRIVATE
	${CMAKE_CURRENT_LIST_DIR}
)
target_compile_definitions(imgui PUBLIC -DNVG_NO_STB -DIMGUI_IMPL_OPENGL_LOADER_GL3W -DIMGUI_ENABLE_FREETYPE)

if (MSVC)
	target_compile_options(imgui PRIVATE "/FI${PCSX_ROOT_DIR}/src/forced-includes/imgui.h"
	)
else()
	target_compile_options(imgui PRIVATE -include "${PCSX_ROOT_DIR}/src/forced-includes/imgui.h")
endif()

target_link_libraries(imgui PUBLIC md4c::md4c freetype fmt)