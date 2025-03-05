add_library(llhttp STATIC EXCLUDE_FROM_ALL)
target_sources(llhttp PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/llhttp/api.c
	${CMAKE_CURRENT_LIST_DIR}/llhttp/http.c
	${CMAKE_CURRENT_LIST_DIR}/llhttp/llhttp.c
)
target_include_directories(llhttp PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/llhttp
)