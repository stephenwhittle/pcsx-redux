#include "core/bufferedlog.h"

#include "core/psxemulator.h"
#include "core/psxmem.h"

void PCSX::BufferedLog::setAddress(uint32_t bufPtr) 
{
    m_bufferState = reinterpret_cast<const BufferState*>(PCSX::g_emulator->m_mem->pointerRead(bufPtr));
    m_bufferData = reinterpret_cast<const char*>(PCSX::g_emulator->m_mem->pointerRead(bufPtr + sizeof(BufferState)));
}

uint16_t PCSX::BufferedLog::avail() const {
    if (m_bufferState == nullptr) {
        return 0;
    }
    //need to check if read has exceeded written before this
    return m_bufferState->m_written - m_bufferState->m_read;
}

uint16_t PCSX::BufferedLog::read(std::span<const char> destBuf) {
    if (m_bufferState == nullptr) {
        return 0;
    }
    //get min of available and span size
    //std::copy between m_bufferData and destBuf
    //increment the consumed value
    return 0;
}
