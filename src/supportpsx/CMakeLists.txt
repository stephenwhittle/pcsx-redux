target_sources(pcsx-redux PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/adpcm.cc
	${CMAKE_CURRENT_LIST_DIR}/adpcmlua.cc
	${CMAKE_CURRENT_LIST_DIR}/assembler.cc
	${CMAKE_CURRENT_LIST_DIR}/binloader.cc
	${CMAKE_CURRENT_LIST_DIR}/binlua.cc
	${CMAKE_CURRENT_LIST_DIR}/iec-60908b.cc
	${CMAKE_CURRENT_LIST_DIR}/ps1-packer.cc
	${CMAKE_CURRENT_LIST_DIR}/ucl-glue.c
)
