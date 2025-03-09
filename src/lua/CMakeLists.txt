add_library(pcsx_lua STATIC)

target_sources(pcsx_lua PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/lua/extra.cc
	${CMAKE_CURRENT_LIST_DIR}/lua/glffi.cc
	${CMAKE_CURRENT_LIST_DIR}/lua/luafile.cc
	${CMAKE_CURRENT_LIST_DIR}/lua/luawrapper.cc
	${CMAKE_CURRENT_LIST_DIR}/lua/zlibffi.cc
)

target_compile_definitions(pcsx_lua PRIVATE
    ${PCSX_COMMON_DEFINES}
)
target_include_directories(pcsx_lua PRIVATE ${PCSX_COMMON_INCLUDES})

target_include_directories(pcsx_lua PUBLIC ${CMAKE_CURRENT_LIST_DIR})

target_link_libraries(pcsx_lua PRIVATE
    avformat
    core
    fmt
    gl3w
    glffi
    imgui_core
    libcurl
    luajit-5.1
    lua_protobuf
    misc_third_party
    support
    uv_a
    zlibffi
    zlibstatic
)
