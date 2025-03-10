target_sources(pcsx-redux PRIVATE 
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
