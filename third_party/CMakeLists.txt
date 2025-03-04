if (NOT GIT_EXECUTABLE)
find_package(Git)
endif()

set(CMAKE_FOLDER "third_party")

add_subdirectory(capstone EXCLUDE_FROM_ALL)
add_subdirectory(freetype EXCLUDE_FROM_ALL)

set(BUILD_CURL_EXE OFF)
set(BUILD_SHARED_LIBS OFF)
set(CURL_DISABLE_INSTALL ON)
set(BUILD_LIBCURL_DOCS OFF)
add_subdirectory(curl EXCLUDE_FROM_ALL)

add_subdirectory(md4c EXCLUDE_FROM_ALL)
add_subdirectory(elfio EXCLUDE_FROM_ALL)
add_subdirectory(fmt EXCLUDE_FROM_ALL)

set(URIPARSER_SHARED_LIBS OFF)
set(URIPARSER_BUILD_DOCS OFF)
set (URIPARSER_BUILD_TESTS OFF)
set (URIPARSER_BUILD_TOOLS OFF)
set (URIPARSER_ENABLE_INSTALL OFF)
add_subdirectory(uriparser)

set(BUILD_DEMOS OFF)
set(BUILD_TESTS OFF)
set(BUILD_EXTENSIONS OFF)
add_subdirectory(zep)

set(ZLIB_BUILD_TESTING OFF)
set(ZLIB_BUILD_SHARED OFF)
set(ZLIB_INSTALL OFF)
add_subdirectory(zlib)

add_subdirectory(xbyak)
add_subdirectory(misc)

include(imgui.cmake)
include(glfw.cmake)
include(gl3w.cmake)
include(cq.cmake)
include(clip.cmake)
include(iec-60908b.cmake)
include(libuv.cmake)


unset(CMAKE_FOLDER)