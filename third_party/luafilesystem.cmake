add_library(lua_filesystem STATIC EXCLUDE_FROM_ALL)
target_sources(lua_filesystem PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/luafilesystem/src/lfs.c
)
target_include_directories(lua_filesystem PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/luafilesystem/src
)

target_link_libraries(lua_filesystem PRIVATE 
	luajit-5.1
)