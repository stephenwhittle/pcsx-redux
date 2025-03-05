add_library(multipart_parser STATIC EXCLUDE_FROM_ALL)
target_sources(multipart_parser PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/multipart-parser-c/multipart_parser.c
	
)
target_include_directories(multipart_parser PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/multipart-parser-c
)