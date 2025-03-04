
add_executable(pcsx-redux)

add_subdirectory(cdrom)
add_subdirectory(core)
add_subdirectory(gpu)
add_subdirectory(lua)
add_subdirectory(main)
add_subdirectory(spu)
add_subdirectory(support)
add_subdirectory(supportpsx)

target_include_directories(pcsx-redux PRIVATE ${CMAKE_CURRENT_LIST_DIR})
target_compile_definitions(pcsx-redux PRIVATE 
    -DIMGUI_IMPL_OPENGL_LOADER_GL3W 
    -DIMGUI_ENABLE_FREETYPE
    -DZEP_FEATURE_CPP_FILE_SYSTEM
    -DNVG_NO_STB
    -DPB_STATIC_API
)
