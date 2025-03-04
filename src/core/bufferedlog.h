#pragma once

#include <stdint.h>
#include <span>

namespace PCSX {
	// Simple view of a chunk of emulator memory as a queue/ringbuffer of data
	// Not thread safe as UI runs on same thread as emulated CPU, so no need for locks
	// to prevent data being mutated out from under us
	class BufferedLog{
		struct BufferState{
			uint32_t m_size;
			uint32_t m_written;
			uint32_t m_read;
			uint32_t m_watermark;
		};
		BufferState* m_bufferState = nullptr;
		const char* m_bufferData = nullptr;
		public:
		
		void setAddress(uint32_t bufPtr);
		uint32_t avail() const;
		uint32_t read(std::span<const char> destBuf);
	};
	
}