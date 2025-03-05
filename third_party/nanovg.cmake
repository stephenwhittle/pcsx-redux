# needs to set NVG_NO_STB
add_library(nanovg STATIC EXCLUDE_FROM_ALL)
target_sources(nanovg PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/nanovg/src/nanovg.c
)
target_include_directories(nanovg PUBLIC 
	${CMAKE_CURRENT_LIST_DIR}/nanovg
)
target_compile_definitions(nanovg PUBLIC -DNVG_NO_STB)