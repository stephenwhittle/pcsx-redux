
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
target_link_libraries(pcsx-redux PRIVATE fmt libuv::libuv zlibstatic misc_third_party imgui_core imgui_filedialog uv_a CURL::libcurl)

message(STATUS "curl" ${CURL_INCLUDE_DIRS})
