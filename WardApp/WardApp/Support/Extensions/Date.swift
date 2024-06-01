//
//  Date.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import Foundation

extension Date {
    
    func formatDateDifference(from date: Date) -> String {
        let currentDate = self
        let timeDifference = currentDate.timeIntervalSince(date)
        
        let secondsInDay: TimeInterval = 86400
        let secondsInWeek: TimeInterval = 604800
        let secondsInMonth: TimeInterval = 2629746
        let secondsInYear: TimeInterval = 31556952
        
        if timeDifference < 0 {
            return ""
        } else if timeDifference < 3600 {
            let minutes = Int(timeDifference / 60)
            return "\(minutes)\(WardStrings.minutesBefore)"
        } else if timeDifference < secondsInDay {
            let hours = Int(timeDifference / 3600)
            return "\(hours)\(WardStrings.hoursBefore)"
        } else if timeDifference < secondsInWeek {
            let days = Int(timeDifference / secondsInDay)
            return "\(days)\(WardStrings.daysBefore)"
        } else if timeDifference < secondsInMonth {
            let weeks = Int(timeDifference / secondsInWeek)
            return "\(weeks)\(WardStrings.weeksBefore)"
        } else if timeDifference < secondsInYear {
            let months = Int(timeDifference / secondsInMonth)
            return "\(months)\(WardStrings.monthsBefore)"
        } else {
            let years = Int(timeDifference / secondsInYear)
            return "\(years)\(WardStrings.yearsBefore)"
        }
    }
}
