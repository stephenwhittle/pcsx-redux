add_library(zep_extensions STATIC EXCLUDE_FROM_ALL)
target_sources(zep_extensions PRIVATE ${CMAKE_CURRENT_LIST_DIR}/zep/extensions/repl/mode_repl.cpp)
target_include_directories(zep_extensions PUBLIC ${CMAKE_CURRENT_LIST_DIR}/zep/extensions)
target_link_libraries(zep_extensions PUBLIC Zep::Zep)