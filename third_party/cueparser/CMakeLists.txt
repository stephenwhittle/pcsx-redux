add_library(cueparser STATIC EXCLUDE_FROM_ALL)
target_sources(cueparser PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/cueparser/cueparser.c
	${CMAKE_CURRENT_LIST_DIR}/cueparser/fileabstract.c
	${CMAKE_CURRENT_LIST_DIR}/cueparser/scheduler.c
)
target_include_directories(cueparser PUBLIC 
	${CMAKE_CURRENT_LIST_DIR}
)