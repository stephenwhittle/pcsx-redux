#include "core/bufferedlog.h"

#include "core/psxemulator.h"
#include "core/psxmem.h"
#include <algorithm>

void PCSX::BufferedLog::setAddress(uint32_t bufPtr) 
{
    m_bufferState = PCSX::g_emulator->m_mem->getPointer<BufferState>(bufPtr);
    m_bufferData = reinterpret_cast<const char*>(PCSX::g_emulator->m_mem->pointerRead(bufPtr + sizeof(BufferState)));
}

uint32_t PCSX::BufferedLog::avail() const {
    if (m_bufferState == nullptr) {
        return 0;
    }
    //need to check if read has exceeded written before this
    return m_bufferState->m_written - m_bufferState->m_read;
}

uint32_t PCSX::BufferedLog::read(std::span<char> destBuf) {
    if (m_bufferState == nullptr) {
        return 0;
    }
    uint32_t ReadAmount = std::min<uint32_t>(avail(), destBuf.size());
    std::copy_n(&m_bufferData[m_bufferState->m_read], ReadAmount, destBuf.begin());
    m_bufferState->m_read += ReadAmount;
    
    return 0;
}
