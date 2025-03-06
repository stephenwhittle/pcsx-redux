add_library(supportpsx STATIC)
target_sources(supportpsx PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/adpcm.cc
	${CMAKE_CURRENT_LIST_DIR}/adpcmlua.cc
	${CMAKE_CURRENT_LIST_DIR}/assembler.cc
	${CMAKE_CURRENT_LIST_DIR}/binloader.cc
	${CMAKE_CURRENT_LIST_DIR}/binlua.cc
	${CMAKE_CURRENT_LIST_DIR}/iec-60908b.cc
	${CMAKE_CURRENT_LIST_DIR}/ps1-packer.cc
	${CMAKE_CURRENT_LIST_DIR}/ucl-glue.c
)
target_compile_definitions(supportpsx PRIVATE
    ${PCSX_COMMON_DEFINES}
)
target_include_directories(supportpsx PRIVATE ${PCSX_COMMON_INCLUDES})


target_link_libraries(supportpsx PRIVATE
    cq
    elfio
    fmt
    iec_60908b
    imgui_core
    libcurl
    luajit-5.1
    misc_third_party
    support
    ucl
    uv_a
    zlibstatic
)
