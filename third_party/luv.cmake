add_library(luv STATIC EXCLUDE_FROM_ALL)
target_sources(luv PRIVATE 
	${CMAKE_CURRENT_LIST_DIR}/luv/src/luv.c
)

target_include_directories(luv PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/luv/src
	${CMAKE_CURRENT_LIST_DIR}/luv/deps/lua-compat-5.3/c-api
	${CMAKE_CURRENT_LIST_DIR}/luv/deps/luajit/src
)
target_link_libraries(luv PUBLIC uv_a)