add_library(lpeg STATIC EXCLUDE_FROM_ALL)
target_sources(lpeg PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/lpeg/lpcap.c
	${CMAKE_CURRENT_LIST_DIR}/lpeg/lpcode.c
	${CMAKE_CURRENT_LIST_DIR}/lpeg/lpcset.c
	${CMAKE_CURRENT_LIST_DIR}/lpeg/lpprint.c
	${CMAKE_CURRENT_LIST_DIR}/lpeg/lptree.c
	${CMAKE_CURRENT_LIST_DIR}/lpeg/lpvm.c
)
target_include_directories(lpeg PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/lpeg
)
target_link_libraries(lpeg PUBLIC 
	luajit-5.1
)