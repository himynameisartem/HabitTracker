//
//  Habit.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

struct Habit {
    var title: String
    var description: String?
    var startDate: Date
    var frequency: Frequency
    private(set) var habitCalendar: [Date]
    private(set) var completionDates: [Date]
    var colorHex: String
    var durationInDays: Int
    
    init(title: String,
         description: String? = nil,
         startDate: Date = Date(),
         frequency: Frequency = .daily,
         completionDates: [Date] = [],
         colorHex: String = "#FFFFFF",
         durationInDays: Int = 21
    ){
        self.title = title
        self.description = description
        self.startDate = startDate
        self.frequency = frequency
        self.completionDates = completionDates
        self.colorHex = colorHex
        self.durationInDays = durationInDays
        
        var dates: [Date] {
            let calendar = Calendar.current
            var dates: [Date] = []
            var date = startDate

            switch frequency {
            case .daily:
                for i in 0..<durationInDays {
                    if let newDate = calendar.date(byAdding: .day, value: i, to: startDate) {
                        dates.append(newDate)
                    }
                }
            case .custom(let daysInterval):
                for i in 0..<durationInDays {
                    if let newDate = calendar.date(byAdding: .day, value: i * daysInterval, to: startDate) {
                        dates.append(newDate)
                    }
                }
            case .weekly(let weekdays):
                let sortedWeekdays = weekdays.sorted(by: { $0.rawValue < $1.rawValue })
                while dates.count < durationInDays {
                    let weekday = calendar.component(.weekday, from: date)
                    if sortedWeekdays.contains(where: { $0.rawValue == weekday }) {
                        dates.append(date)
                    }
                    guard let nextDate = calendar.date(byAdding: .day, value: 1, to: date) else {
                        break
                    }
                    date = nextDate
                }
            }
            return dates
        }
        habitCalendar = dates
    }
    
    mutating func addComletionDate(_ date: Date) {
        if !completionDates.contains(where: {$0.isSameDay(as: date)}) &&
            completionDates.count < durationInDays {
                completionDates.append(date)
            }
    }
}

