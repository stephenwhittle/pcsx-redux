include(CMakeFolders)
cmake_push_folder("pcsx-redux")
add_executable(pcsx-redux)

set(PCSX_COMMON_DEFINES
    -DUNICODE 
    -D_UNICODE
    "-DPCSX_SRC_ROOT_DIR=${PCSX_SRC_ROOT_DIR}"
)

set(PCSX_COMMON_INCLUDES
    #"${CMAKE_CURRENT_LIST_DIR}"
    "${PCSX_GENERATED_CODE_DIR}"
)

target_compile_definitions(pcsx-redux PRIVATE ${PCSX_COMMON_DEFINES})
target_include_directories(pcsx-redux PRIVATE ${PCSX_COMMON_INCLUDES})
cmake_push_folder("modules")
add_subdirectory(cdrom)
add_subdirectory(core)
add_subdirectory(gpu)
add_subdirectory(gui)
add_subdirectory(lua)
add_subdirectory(main)
add_subdirectory(spu)
add_subdirectory(support)
add_subdirectory(supportpsx)
add_subdirectory(mips)
cmake_pop_folder()
# relocate these files so they can be included with a path prefix and not clash with files of similar names in third-party dependencies
file(COPY ${PCSX_SRC_ROOT_DIR}/AUTHORS DESTINATION ${PCSX_GENERATED_CODE_DIR})
file(COPY ${PCSX_SRC_ROOT_DIR}/LICENSES.md DESTINATION ${PCSX_GENERATED_CODE_DIR})


target_link_libraries(pcsx-redux PRIVATE 
    cdrom
    core
    gpu
    gui
    pcsx_lua
    spu
    support
    supportpsx
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
cmake_pop_folder()
