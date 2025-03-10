#include "core/bufferedlog.h"

#include <algorithm>

#include "core/psxemulator.h"
#include "core/psxmem.h"

void PCSX::BufferedLog::setAddress(uint32_t bufPtr) {
    m_bufferState = PCSX::g_emulator->m_mem->getPointer<BufferState>(bufPtr);
    m_bufferData = reinterpret_cast<const char*>(PCSX::g_emulator->m_mem->pointerRead(bufPtr + sizeof(BufferState)));
}

uint32_t PCSX::BufferedLog::avail() const {
    if (m_bufferState == nullptr) {
        return 0;
    }
    if (m_bufferState->m_watermark > m_bufferState->m_read) {
        return m_bufferState->m_watermark - m_bufferState->m_read;
    }
    // if we've caught up to the watermark then we need to start from 0 again
    if (m_bufferState->m_watermark == m_bufferState->m_read) {
        if (m_bufferState->m_written < m_bufferState->m_watermark) {
            return m_bufferState->m_written;
        }
        return 0;
    }
    // need to check if read has exceeded written before this
    return m_bufferState->m_written - m_bufferState->m_read;
}

uint32_t PCSX::BufferedLog::read(std::span<char> destBuf) {
    if (m_bufferState == nullptr) {
        return 0;
    }
    uint32_t ReadAmount = std::min<uint32_t>(avail(), destBuf.size());
    
    // if we've caught up to the watermark then we need to start from 0 again
    if (m_bufferState->m_watermark == m_bufferState->m_read) {
        m_bufferState->m_read = 0;
    }
    std::copy_n(&m_bufferData[m_bufferState->m_read], ReadAmount, destBuf.begin());

    return ReadAmount;
}

void PCSX::BufferedLog::consume(uint32_t count) { m_bufferState->m_read += count; }
