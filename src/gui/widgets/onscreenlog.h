/***************************************************************************
 *   Copyright (C) 2019 PCSX-Redux authors                                 *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.           *
 ***************************************************************************/

#pragma once

#include <deque>
#include <stdexcept>
#include <string>

#include "imgui.h"

namespace PCSX {
class GUI;
namespace Widgets {

/// @brief Simple wrapper around a list of log messages with a specific expiry
/// New messages appear at the top of the list and will be removed once they expire
class OnScreenLog {
    struct LogEntry {
        double elapsed;
        std::string logText;
        LogEntry(std::string&& text) : elapsed(0), logText(text) {};
    };
    std::deque<LogEntry> m_entries;
    std::size_t m_maxEntries = 32;
    double m_expiryTime = 5.0;
  public:
    bool addLog(std::string&& log);
    bool draw();

  private:
};

}  // namespace Widgets
}  // namespace PCSX
