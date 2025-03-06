add_library (spu STATIC)

target_sources(spu PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/adsr.cc
	${CMAKE_CURRENT_LIST_DIR}/cfg.cc
	${CMAKE_CURRENT_LIST_DIR}/debug.cc
	${CMAKE_CURRENT_LIST_DIR}/dma.cc
	${CMAKE_CURRENT_LIST_DIR}/freeze.cc
	${CMAKE_CURRENT_LIST_DIR}/miniaudio.cc
	${CMAKE_CURRENT_LIST_DIR}/registers.cc
	${CMAKE_CURRENT_LIST_DIR}/reverb.cc
	${CMAKE_CURRENT_LIST_DIR}/spu.cc
	${CMAKE_CURRENT_LIST_DIR}/xa.cc
)

target_compile_definitions(spu PRIVATE
    ${PCSX_COMMON_DEFINES}
)
target_include_directories(spu PRIVATE ${PCSX_COMMON_INCLUDES})

#workaround for miniaudio includes, to be refactored later
target_include_directories(spu PRIVATE ${PCSX_ROOT_DIR}/third_party)

target_link_libraries(spu PRIVATE
    fmt
    imgui_core
    libcurl
    luajit-5.1
    misc_third_party
    support
    uv_a
    zlibstatic
)
