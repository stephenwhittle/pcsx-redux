include(CMakeFolders)

if (NOT GIT_EXECUTABLE)
find_package(Git)
endif()

cmake_push_folder("third_party")

cmake_push_folder("capstone")
add_subdirectory(capstone EXCLUDE_FROM_ALL)
cmake_pop_folder()

add_subdirectory(freetype EXCLUDE_FROM_ALL)

cmake_push_folder("curl")
set(BUILD_CURL_EXE OFF)
set(BUILD_SHARED_LIBS OFF)
set(CURL_DISABLE_INSTALL ON)
set(BUILD_LIBCURL_DOCS OFF)
set(ENABLE_UNICODE ON)
add_subdirectory(curl EXCLUDE_FROM_ALL)
cmake_pop_folder()

cmake_push_folder("md4c")
add_subdirectory(md4c EXCLUDE_FROM_ALL)
cmake_pop_folder()

cmake_push_folder("elfio")
add_subdirectory(elfio EXCLUDE_FROM_ALL)
cmake_pop_folder()

cmake_push_folder(fmt)
add_subdirectory(fmt EXCLUDE_FROM_ALL)
cmake_pop_folder()

CMAKE_PUSH_FOLDER("uriparser")
set(URIPARSER_SHARED_LIBS OFF)
set(URIPARSER_BUILD_DOCS OFF)
set (URIPARSER_BUILD_TESTS OFF)
set (URIPARSER_BUILD_TOOLS OFF)
set (URIPARSER_ENABLE_INSTALL OFF)
add_subdirectory(uriparser)
cmake_pop_folder()

cmake_push_folder("zep")
set(BUILD_DEMOS OFF)
set(BUILD_TESTS OFF)
set(BUILD_EXTENSIONS OFF)
add_subdirectory(zep)
include(zep_extensions.cmake)
cmake_pop_folder()

cmake_push_folder("zlib")
set(ZLIB_BUILD_TESTING OFF)
set(ZLIB_BUILD_SHARED OFF)
set(ZLIB_INSTALL OFF)
add_subdirectory(zlib)
cmake_pop_folder()

add_subdirectory(misc)

cmake_push_folder("lua")
set(BUILD_MODULE OFF)
set (LUAJIT_BUILD_EXE OFF CACHE BOOL "")
set (LUAJIT_ENABLE_LUA52COMPAT ON CACHE BOOL "")
set(BUILD_STATIC_LIBS ON)
add_subdirectory(luv)
add_subdirectory(lua-protobuf)
include(imgui_lua_bindings.cmake)
include(luafilesystem.cmake)
include(lpeg.cmake)
include(glffi.cmake)
include(zlibffi.cmake)
cmake_pop_folder()

cmake_push_folder("cdrom")
add_subdirectory(cueparser)
add_subdirectory(iec-60908b)
cmake_pop_folder()

add_subdirectory(cq)

include(xbyak.cmake)


include(llhttp.cmake)
include(miniaudio.cmake)
include(multipart_parser.cmake)
include(nanovg.cmake)

cmake_push_folder("gl")
include(glfw.cmake)
include(gl3w.cmake)
cmake_pop_folder()

include(clip.cmake)
include(libav.cmake)
include(ucl.cmake)

include(imgui.cmake)

cmake_pop_folder()