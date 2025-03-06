add_library(gpu STATIC)

target_sources(gpu PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/soft/draw.cc
	${CMAKE_CURRENT_LIST_DIR}/soft/gpu.cc
	${CMAKE_CURRENT_LIST_DIR}/soft/soft.cc
)

target_compile_definitions(gpu PRIVATE
    ${PCSX_COMMON_DEFINES}
)
target_include_directories(gpu PRIVATE ${PCSX_COMMON_INCLUDES})

target_link_libraries(gpu PRIVATE 
    fmt
    gl3w 
    gui
    imgui_core
    imgui_md
    libcurl
    luajit-5.1
    misc_third_party
    support
    uv_a
    Zep
    zep_extensions
    zlibstatic
)
