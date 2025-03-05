
add_executable(pcsx-redux)

add_subdirectory(cdrom)
add_subdirectory(core)
add_subdirectory(gpu)
add_subdirectory(gui)
add_subdirectory(lua)
add_subdirectory(main)
add_subdirectory(spu)
add_subdirectory(support)
add_subdirectory(supportpsx)

file(COPY ${PCSX_SRC_ROOT_DIR}/AUTHORS DESTINATION ${PCSX_GENERATED_CODE_DIR})
file(COPY ${PCSX_SRC_ROOT_DIR}/LICENSES.md DESTINATION ${PCSX_GENERATED_CODE_DIR})

target_compile_definitions(pcsx-redux PRIVATE 
    -DUNICODE 
    -D_UNICODE
    -DPCSX_SRC_ROOT_DIR=${PCSX_SRC_ROOT_DIR}
)
target_include_directories(pcsx-redux PRIVATE 
    ${CMAKE_CURRENT_LIST_DIR}
    ${PCSX_GENERATED_CODE_DIR}
)
target_link_libraries(pcsx-redux PRIVATE 
    fmt 
    zlibstatic 
    misc_third_party 
    imgui_core 
    imgui_md 
    imgui_filedialog 
    CURL::libcurl 
    gl3w 
    avcodec
    avutil
    avformat
    Zep::Zep 
    glffi 
    zep_extensions 
    zlibffi
    uriparser
    ucl
    elfio
    libluv_a
    luajit-5.1
    uv_a
    cueparser
    iec_60908b
    clip
    lua_filesystem
    xbyak
    lpeg
    capstone
    nanovg
    llhttp
    multipart_parser
    lua_protobuf
    imgui_lua_bindings
    swresample
    cq
)
if (WIN32)


target_link_libraries(pcsx-redux PRIVATE
    shlwapi
    windowscodecs
    gdi32
)

if (PCSX_USE_CLI)

    target_compile_definitions(pcsx-redux PRIVATE -DPCSX_CLI=1)
    if (MSVC)
        target_link_options(pcsx-redux PRIVATE /SUBSYSTEM:CONSOLE)
    else()
        target_link_options(pcsx-redux PRIVATE -Wl,--subsystem,console)
    endif()

else()
    if (MSVC)
        target_link_options(pcsx-redux PRIVATE /SUBSYSTEM:WINDOWS)
    else()
        target_link_options(pcsx-redux PRIVATE -Wl,--subsystem,windows)
    endif()

endif()


add_custom_command(TARGET pcsx-redux POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_RUNTIME_DLLS:pcsx-redux> $<TARGET_FILE_DIR:pcsx-redux>
  COMMAND_EXPAND_LISTS
  )

endif()
