# 
#  Copyright (C) 2021 mod.io Pty Ltd. <https://mod.io>
#  
#  This file is part of the mod.io SDK.
#  
#  Distributed under the MIT License. (See accompanying file LICENSE or 
#   view online at <https://github.com/modio/modio-sdk/blob/main/LICENSE>)
#   
# 

# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#[=======================================================================[.rst:
FindGit
-------

The module defines the following ``IMPORTED`` targets (when
:prop_gbl:`CMAKE_ROLE` is ``PROJECT``):

``Git::Git``
  Executable of the Git command-line client.

The module defines the following variables:

``GIT_EXECUTABLE``
  Path to Git command-line client.
``Git_FOUND``, ``GIT_FOUND``
  True if the Git command-line client was found.
``GIT_VERSION_STRING``
  The version of Git found.

Example usage:

.. code-block:: cmake

   find_package(Git)
   if(Git_FOUND)
     message("Git found: ${GIT_EXECUTABLE}")
   endif()
#]=======================================================================]

# Look for 'git' or 'eg' (easy git)
#
message("Searching with overridden FindGit")
set(git_names git eg)

# Prefer .cmd variants on Windows unless running in a Makefile
# in the MSYS shell.
#
if(CMAKE_HOST_WIN32)
  if(NOT CMAKE_GENERATOR MATCHES "MSYS")
    set(git_names git.cmd git eg.cmd eg)
    # GitHub search path for Windows
    file(GLOB github_path
      "$ENV{LOCALAPPDATA}/Github/PortableGit*/cmd"
      "$ENV{LOCALAPPDATA}/Github/PortableGit*/bin"
      )
    # SourceTree search path for Windows
    set(_git_sourcetree_path "$ENV{LOCALAPPDATA}/Atlassian/SourceTree/git_local/bin")
    
    find_file(LOCATEVS_MODULE NAMES LocateVisualStudio.cmake PATHS ${CMAKE_MODULE_PATH} "Path to LocateVisualStudio.cmake")
    if (NOT LOCATEVS_MODULE EQUAL LOCATEVS_MODULE-NOTFOUND)
        message("Found LocateVisualStudio.cmake, locating VS...")
        include(LocateVisualStudio)
        locate_vs("latest" LOCATED_VS_DIR)
        if (LOCATED_VS_DIR)
            set(LOCATED_VS_DIR "${LOCATED_VS_DIR}/Common7/IDE/CommonExtensions/Microsoft/TeamFoundation/Team Explorer/Git/cmd")
        endif()
    endif()

  endif()
endif()

# First search the PATH and specific locations.
find_program(GIT_EXECUTABLE
  NAMES ${git_names}
  PATHS ${github_path} ${_git_sourcetree_path} ${LOCATED_VS_DIR}
  DOC "Git command line client"
  )

if(CMAKE_HOST_WIN32)
message("searching...")
  # Now look for installations in Git/ directories under typical installation
  # prefixes on Windows.  Exclude PATH from this search because VS 2017's
  # command prompt happens to have a PATH entry with a Git/ subdirectory
  # containing a minimal git not meant for general use.
  find_program(GIT_EXECUTABLE
    NAMES ${git_names}
    PATH_SUFFIXES Git/cmd Git/bin
    DOC "Git command line client"
    )
endif()

mark_as_advanced(GIT_EXECUTABLE)

unset(git_names)
unset(_git_sourcetree_path)

if(GIT_EXECUTABLE)
  execute_process(COMMAND ${GIT_EXECUTABLE} --version
                  OUTPUT_VARIABLE git_version
                  ERROR_QUIET
                  OUTPUT_STRIP_TRAILING_WHITESPACE)
  if (git_version MATCHES "^git version [0-9]")
    string(REPLACE "git version " "" GIT_VERSION_STRING "${git_version}")
  endif()
  unset(git_version)

  get_property(_findgit_role GLOBAL PROPERTY CMAKE_ROLE)
  if(_findgit_role STREQUAL "PROJECT" AND NOT TARGET Git::Git)
    add_executable(Git::Git IMPORTED)
    set_property(TARGET Git::Git PROPERTY IMPORTED_LOCATION "${GIT_EXECUTABLE}")
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Git
                                  REQUIRED_VARS GIT_EXECUTABLE
                                  VERSION_VAR GIT_VERSION_STRING)
