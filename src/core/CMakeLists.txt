add_library(core STATIC)

target_sources(core PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/core/arguments.cc
	${CMAKE_CURRENT_LIST_DIR}/core/bufferedlog.cc
	${CMAKE_CURRENT_LIST_DIR}/core/callstacks.cc
	${CMAKE_CURRENT_LIST_DIR}/core/cdrom.cc
	${CMAKE_CURRENT_LIST_DIR}/core/debug.cc
	${CMAKE_CURRENT_LIST_DIR}/core/decode_xa.cc
	${CMAKE_CURRENT_LIST_DIR}/core/display.cc
	${CMAKE_CURRENT_LIST_DIR}/core/disr3000a.cc
	${CMAKE_CURRENT_LIST_DIR}/core/eventslua.cc
	${CMAKE_CURRENT_LIST_DIR}/core/gdb-server.cc
	${CMAKE_CURRENT_LIST_DIR}/core/gpu.cc
	${CMAKE_CURRENT_LIST_DIR}/core/gpulogger.cc
	${CMAKE_CURRENT_LIST_DIR}/core/gte.cc
	${CMAKE_CURRENT_LIST_DIR}/core/kernel.cc
	${CMAKE_CURRENT_LIST_DIR}/core/kernellog.cc
	${CMAKE_CURRENT_LIST_DIR}/core/luaiso.cc
	${CMAKE_CURRENT_LIST_DIR}/core/mdec.cc
	${CMAKE_CURRENT_LIST_DIR}/core/memorycard.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pad.cc
	${CMAKE_CURRENT_LIST_DIR}/core/patchmanager.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pcsxlua.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pgxp_cpu.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pgxp_debug.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pgxp_gte.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pgxp_mem.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pgxp_value.cc
	${CMAKE_CURRENT_LIST_DIR}/core/pio-cart.cc
	${CMAKE_CURRENT_LIST_DIR}/core/psxcounters.cc
	${CMAKE_CURRENT_LIST_DIR}/core/psxdma.cc
	${CMAKE_CURRENT_LIST_DIR}/core/psxemulator.cc
	${CMAKE_CURRENT_LIST_DIR}/core/psxhw.cc
	${CMAKE_CURRENT_LIST_DIR}/core/psxinterpreter.cc
	${CMAKE_CURRENT_LIST_DIR}/core/psxmem.cc
	${CMAKE_CURRENT_LIST_DIR}/core/r3000a.cc
	${CMAKE_CURRENT_LIST_DIR}/core/sio.cc
	${CMAKE_CURRENT_LIST_DIR}/core/sio1-server.cc
	${CMAKE_CURRENT_LIST_DIR}/core/sio1.cc
	${CMAKE_CURRENT_LIST_DIR}/core/spu.cc
	${CMAKE_CURRENT_LIST_DIR}/core/sstate.cc
	${CMAKE_CURRENT_LIST_DIR}/core/system.cc
	${CMAKE_CURRENT_LIST_DIR}/core/ui.cc
	${CMAKE_CURRENT_LIST_DIR}/core/web-server.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_aa64/gte_aa64.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_aa64/instructions.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_aa64/recompiler.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_aa64/regAllocation.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_x64/gte_x64.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_x64/instructions.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_x64/profiler.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_x64/recompiler.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_x64/regAllocation.cc
	${CMAKE_CURRENT_LIST_DIR}/core/DynaRec_x64/symbols.cc
	${CMAKE_CURRENT_LIST_DIR}/core/OpenGL_GPU/gpu_opengl.cc
)

target_compile_definitions(core PRIVATE
    ${PCSX_COMMON_DEFINES}
    -DPB_STATIC_API
)
target_include_directories(core PRIVATE ${PCSX_COMMON_INCLUDES})

target_include_directories(core PUBLIC ${CMAKE_CURRENT_LIST_DIR})

target_link_libraries(core PRIVATE
    fmt
    gl3w
    imgui_core
    imgui_md
    libcurl
    luajit-5.1
    misc_third_party
    spu
    support
    uriparser
    uv_a
    xbyak
    zlibstatic
    Zep
    zep_extensions
)
