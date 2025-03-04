add_library(clip STATIC EXCLUDE_FROM_ALL)

target_sources(clip PRIVATE

	${CMAKE_CURRENT_LIST_DIR}/clip/clip.cpp
	${CMAKE_CURRENT_LIST_DIR}/clip/image.cpp
)
if (CMAKE_SYSTEM_NAME STREQUAL "Darwin")

	target_sources(clip PRIVATE
		${CMAKE_CURRENT_LIST_DIR}/clip/clip_osx.mm
	)
elseif ((CMAKE_SYSTEM_NAME STREQUAL "Windows") OR
		(CMAKE_SYSTEM_NAME STREQUAL "MSYS") OR 
		(CMAKE_SYSTEM_NAME STREQUAL "CYGWIN"))

	target_sources(clip PRIVATE
		${CMAKE_CURRENT_LIST_DIR}/clip/clip_win.cpp
	)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")

	target_sources(clip PRIVATE
		${CMAKE_CURRENT_LIST_DIR}/clip/clip_x11.cpp
	)

else()
	

endif()
