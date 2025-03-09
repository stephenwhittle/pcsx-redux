add_library (spu STATIC)

target_sources(spu PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/spu/adsr.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/cfg.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/debug.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/dma.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/freeze.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/miniaudio.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/registers.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/reverb.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/spu.cc
	${CMAKE_CURRENT_LIST_DIR}/spu/xa.cc
)

target_compile_definitions(spu PRIVATE
    ${PCSX_COMMON_DEFINES}
)
target_include_directories(spu PRIVATE ${PCSX_COMMON_INCLUDES})

#workaround for miniaudio includes, to be refactored later
target_include_directories(spu PRIVATE ${PCSX_ROOT_DIR}/third_party)

target_include_directories(spu PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_link_libraries(spu PRIVATE
    core
    fmt
    imgui_core
    libcurl
    luajit-5.1
    misc_third_party
    support
    uv_a
    zlibstatic
)
