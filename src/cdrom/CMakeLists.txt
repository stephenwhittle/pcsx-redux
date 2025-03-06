add_library(cdrom STATIC)

target_sources(cdrom PRIVATE 
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-cbin.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-ccd.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-cue.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-ecm.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-mds.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-pbp.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-sbi.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso-toc.cc
    ${CMAKE_CURRENT_LIST_DIR}/cdriso.cc
    ${CMAKE_CURRENT_LIST_DIR}/file.cc
    ${CMAKE_CURRENT_LIST_DIR}/iso9660-builder.cc
    ${CMAKE_CURRENT_LIST_DIR}/iso9660-reader.cc
    ${CMAKE_CURRENT_LIST_DIR}/ppf.cc
)

target_compile_definitions(cdrom PRIVATE ${PCSX_COMMON_DEFINES})
target_include_directories(cdrom PRIVATE ${PCSX_COMMON_INCLUDES})

target_link_libraries(cdrom PRIVATE
    avcodec
    cueparser
    fmt
    iec_60908b
    imgui_core
    libcurl
    luajit-5.1
    misc_third_party
    support
    uv_a
    zlibstatic
)
