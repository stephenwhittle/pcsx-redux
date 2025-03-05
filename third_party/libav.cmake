include(FetchContent)


FetchContent_Declare(
	libav
	URL https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full-shared.7z
	EXCLUDE_FROM_ALL
)

FetchContent_MakeAvailable(libav)

add_library(avcodec SHARED IMPORTED GLOBAL)
if (WIN32)
set_target_properties(avcodec PROPERTIES IMPORTED_LOCATION ${libav_SOURCE_DIR}/bin/avcodec-61.dll)
if (MSVC)
set_target_properties(avcodec PROPERTIES IMPORTED_IMPLIB ${libav_SOURCE_DIR}/lib/avcodec.lib)
endif()
endif()
set_target_properties(avcodec PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${libav_SOURCE_DIR}/include)

add_library(avutil SHARED IMPORTED GLOBAL)
if (WIN32)
set_target_properties(avutil PROPERTIES IMPORTED_LOCATION ${libav_SOURCE_DIR}/bin/avutil-59.dll)
if (MSVC)
set_target_properties(avutil PROPERTIES IMPORTED_IMPLIB ${libav_SOURCE_DIR}/lib/avutil.lib)
endif()
endif()
set_target_properties(avutil PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${libav_SOURCE_DIR}/include)

add_library(avformat SHARED IMPORTED GLOBAL)
if (WIN32)
set_target_properties(avformat PROPERTIES IMPORTED_LOCATION ${libav_SOURCE_DIR}/bin/avformat-61.dll)
if (MSVC)
set_target_properties(avformat PROPERTIES IMPORTED_IMPLIB ${libav_SOURCE_DIR}/lib/avformat.lib)
endif()
endif()
set_target_properties(avformat PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${libav_SOURCE_DIR}/include)


add_library(swresample SHARED IMPORTED GLOBAL)
if (WIN32)
set_target_properties(swresample PROPERTIES IMPORTED_LOCATION ${libav_SOURCE_DIR}/bin/swresample-5.dll)
if (MSVC)
set_target_properties(swresample PROPERTIES IMPORTED_IMPLIB ${libav_SOURCE_DIR}/lib/swresample.lib)
endif()
endif()
set_target_properties(swresample PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${libav_SOURCE_DIR}/include)
