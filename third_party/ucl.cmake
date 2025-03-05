add_library(ucl STATIC EXCLUDE_FROM_ALL)
target_sources(ucl PRIVATE 
	${CMAKE_CURRENT_LIST_DIR}/ucl/src/n2e_99.c
	${CMAKE_CURRENT_LIST_DIR}/ucl/src/alloc.c
)
target_include_directories(ucl PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/ucl
)
target_include_directories(ucl PUBLIC 
	${CMAKE_CURRENT_LIST_DIR}/ucl/include
)
target_compile_definitions(ucl PUBLIC
	-DACC_CONFIG_AUTO_NO_FUNCTIONS
)