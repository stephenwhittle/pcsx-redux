add_library(cq STATIC EXCLUDE_FROM_ALL)
target_include_directories(cq PUBLIC 
	${CMAKE_CURRENT_LIST_DIR}/cq
)
target_sources(cq PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/cq/reclaimer.cc
)
