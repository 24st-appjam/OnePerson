import Foundation

extension Date {
    func fetchAllDatesInCurrentWeek() -> [Date] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 1
        guard let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: self),
              let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: firstWeek.end - 1) else { return [] }
        let interval = DateInterval(start: firstWeek.start, end: lastWeek.end)
        return calendar.generateDays(for: interval)
    }

    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }

    /// 날짜의 요일을 Int로 return합니다.
    ///
    /// 1: 일요일
    /// 7: 토요일
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }

    var weekOfMonth: Int {
        Calendar.current.component(.weekOfMonth, from: self)
    }

    var weekdayString: String {
        switch weekday {
        case 1: return "일"
        case 2: return "월"
        case 3: return "화"
        case 4: return "수"
        case 5: return "목"
        case 6: return "금"
        case 7: return "토"
        default: return ""
        }
    }
}

import SwiftUI

struct CalendarDateView: View {
    var body: some View {
        Image("CalendarPrev")
    }
}

private extension Calendar {
    func generateDates(for interval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates = [interval.start]
        enumerateDates(startingAfter: interval.start, matching: components, matchingPolicy: .nextTime) { result, _, stop in
            guard let date = result else { return }
            guard date < interval.end else {
                stop = true
                return
            }
            dates.append(date)
        }
        return dates
    }
    
    func generateDays(for interval: DateInterval) -> [Date] {
        generateDates(for: interval, matching: dateComponents([.hour, .minute, .second], from: interval.start))
    }
}
