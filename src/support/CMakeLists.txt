add_library(support STATIC EXCLUDE_FROM_ALL)

target_sources(support PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/binpath-linux.cc
	${CMAKE_CURRENT_LIST_DIR}/binpath-macos.cc
	${CMAKE_CURRENT_LIST_DIR}/binpath-windows.cc
	${CMAKE_CURRENT_LIST_DIR}/container-file.cc
	${CMAKE_CURRENT_LIST_DIR}/ffmpeg-audio-file.cc
	${CMAKE_CURRENT_LIST_DIR}/file.cc
	${CMAKE_CURRENT_LIST_DIR}/md5.cc
	${CMAKE_CURRENT_LIST_DIR}/mem4g.cc
	${CMAKE_CURRENT_LIST_DIR}/sharedmem-unix.cc
	${CMAKE_CURRENT_LIST_DIR}/sharedmem-windows.cc
	${CMAKE_CURRENT_LIST_DIR}/sharedmem.cc
	${CMAKE_CURRENT_LIST_DIR}/sjis_conv.cc
	${CMAKE_CURRENT_LIST_DIR}/uvfile.cc
	${CMAKE_CURRENT_LIST_DIR}/version-linux.cc
	${CMAKE_CURRENT_LIST_DIR}/version-macos.cc
	${CMAKE_CURRENT_LIST_DIR}/version-windows.cc
	${CMAKE_CURRENT_LIST_DIR}/version.cc
	${CMAKE_CURRENT_LIST_DIR}/zfile.cc
	${CMAKE_CURRENT_LIST_DIR}/zip.cc
)
target_compile_definitions(support PRIVATE
    ${PCSX_COMMON_DEFINES}
    -DNOMINMAX
)
target_include_directories(support PRIVATE ${PCSX_COMMON_INCLUDES})

target_link_libraries(support PRIVATE
    avcodec
    avformat
    avutil
    fmt
    libcurl
    misc_third_party
    swresample
    uv_a
    zlibstatic
)
target_link_libraries(support PUBLIC
    cq
)
