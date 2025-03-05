add_library(iec_60908b STATIC EXCLUDE_FROM_ALL)
target_sources(iec_60908b PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/iec-60908b/edcecc.c
	${CMAKE_CURRENT_LIST_DIR}/iec-60908b/tables.c
)
target_include_directories(iec_60908b PUBLIC
	${CMAKE_CURRENT_LIST_DIR}
)
