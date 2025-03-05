add_library(imgui_lua_bindings STATIC)
target_sources(imgui_lua_bindings PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/imgui_lua_bindings/imgui_lua_bindings.cpp
)
target_link_libraries(imgui_lua_bindings PRIVATE luajit-5.1 imgui_core)