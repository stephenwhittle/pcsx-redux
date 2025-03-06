add_library(lua_protobuf STATIC EXCLUDE_FROM_ALL)
target_sources(lua_protobuf PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/lua-protobuf/pb.c
	
)
target_include_directories(lua_protobuf PUBLIC
	${CMAKE_CURRENT_LIST_DIR}
)
target_link_libraries(lua_protobuf PRIVATE luajit-5.1)

target_compile_definitions(lua_protobuf PUBLIC -DPB_STATIC_API)