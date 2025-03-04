target_sources(pcsx-redux PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/adsr.cc
	${CMAKE_CURRENT_LIST_DIR}/cfg.cc
	${CMAKE_CURRENT_LIST_DIR}/debug.cc
	${CMAKE_CURRENT_LIST_DIR}/dma.cc
	${CMAKE_CURRENT_LIST_DIR}/freeze.cc
	${CMAKE_CURRENT_LIST_DIR}/miniaudio.cc
	${CMAKE_CURRENT_LIST_DIR}/registers.cc
	${CMAKE_CURRENT_LIST_DIR}/reverb.cc
	${CMAKE_CURRENT_LIST_DIR}/spu.cc
	${CMAKE_CURRENT_LIST_DIR}/xa.cc
)
