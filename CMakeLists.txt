cmake_minimum_required(VERSION 3.25)
set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)

set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake;${CMAKE_MODULE_PATH}")

project(pcsx-redux C CXX ASM)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED On)

set (PCSX_SRC_ROOT_DIR ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "")
set (PCSX_GENERATED_CODE_DIR ${CMAKE_CURRENT_BINARY_DIR}/generated CACHE STRING "")

option(PCSX_USE_CLI "Use a console window to display log output" OFF)

add_subdirectory(third_party)

add_subdirectory(src)
