#include "onscreenlog.h"

bool PCSX::Widgets::OnScreenLog::addLog(std::string&& log) {
    if (m_entries.size() == 32) {
        m_entries.pop_front();
    }
    m_entries.push_back(LogEntry{std::move(log)});
    return true;
}

bool PCSX::Widgets::OnScreenLog::draw() {
    if (m_entries.size() == 0) {
        return false;
    }
    double currentTime = ImGui::GetIO().DeltaTime;
    std::size_t elementsToRemove = 0;
    for (auto LogIt = m_entries.rbegin(); LogIt != m_entries.rend(); LogIt++) {
        ImGui::TextUnformatted((*LogIt).logText.c_str());
    }
    for (LogEntry& CurrentEntry : m_entries) {
        CurrentEntry.elapsed += currentTime;

        if (CurrentEntry.elapsed > m_expiryTime) {
            elementsToRemove++;
        }
    }
    if (elementsToRemove) {
        if (elementsToRemove > m_entries.size()) {
            elementsToRemove = m_entries.size();
        }
        auto endIt = m_entries.begin();
        std::advance(endIt, elementsToRemove);
        m_entries.erase(m_entries.begin(), endIt);
    }
    return true;
}
