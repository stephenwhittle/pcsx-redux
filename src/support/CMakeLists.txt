add_library(support STATIC EXCLUDE_FROM_ALL)

target_sources(support PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/support/binpath-linux.cc
	${CMAKE_CURRENT_LIST_DIR}/support/binpath-macos.cc
	${CMAKE_CURRENT_LIST_DIR}/support/binpath-windows.cc
	${CMAKE_CURRENT_LIST_DIR}/support/container-file.cc
	${CMAKE_CURRENT_LIST_DIR}/support/ffmpeg-audio-file.cc
	${CMAKE_CURRENT_LIST_DIR}/support/file.cc
	${CMAKE_CURRENT_LIST_DIR}/support/md5.cc
	${CMAKE_CURRENT_LIST_DIR}/support/mem4g.cc
	${CMAKE_CURRENT_LIST_DIR}/support/sharedmem-unix.cc
	${CMAKE_CURRENT_LIST_DIR}/support/sharedmem-windows.cc
	${CMAKE_CURRENT_LIST_DIR}/support/sharedmem.cc
	${CMAKE_CURRENT_LIST_DIR}/support/sjis_conv.cc
	${CMAKE_CURRENT_LIST_DIR}/support/uvfile.cc
	${CMAKE_CURRENT_LIST_DIR}/support/version-linux.cc
	${CMAKE_CURRENT_LIST_DIR}/support/version-macos.cc
	${CMAKE_CURRENT_LIST_DIR}/support/version-windows.cc
	${CMAKE_CURRENT_LIST_DIR}/support/version.cc
	${CMAKE_CURRENT_LIST_DIR}/support/zfile.cc
	${CMAKE_CURRENT_LIST_DIR}/support/zip.cc
)
target_compile_definitions(support PRIVATE
    ${PCSX_COMMON_DEFINES}
    -DNOMINMAX
)
target_include_directories(support PRIVATE ${PCSX_COMMON_INCLUDES})
target_include_directories(support PUBLIC ${CMAKE_CURRENT_LIST_DIR})

target_link_libraries(support PRIVATE
    avcodec
    avformat
    avutil
    core
    fmt
    libcurl
    mips_headers
    misc_third_party

    swresample
    uv_a
    zlibstatic
    mips_headers
)
target_link_libraries(support PUBLIC
    cq
        pcsx_lua
)
