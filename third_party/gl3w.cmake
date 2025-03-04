add_library(gl3w STATIC EXCLUDE_FROM_ALL)
target_sources(gl3w PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/gl3w/GL/gl3w-throwers.cc
	${CMAKE_CURRENT_LIST_DIR}/gl3w/GL/gl3w.c
)
target_include_directories(gl3w PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/gl3w
)
