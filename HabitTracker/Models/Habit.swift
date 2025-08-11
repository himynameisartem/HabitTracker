//
//  Habit.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

struct Habit: Equatable {
    var title: String
    var description: String?
    var startDate: Date
    var endDate: Date
    var frequency: Frequency
    private(set) var scheduledDates: [Date] = []
    var completionDates: [Date]
    var colorHex: String
    var durationInDays: Int
    
    init(title: String,
         description: String? = nil,
         startDate: Date = Date(),
         endDate: Date? = nil,
         frequency: Frequency = .daily,
         completionDates: [Date] = [],
         colorHex: String = "#FFFFFF",
         durationInDays: Int? = nil
    ){
        self.title = title
        self.description = description
        self.startDate = startDate
        self.frequency = frequency
        self.completionDates = completionDates
        self.colorHex = colorHex
        
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        self.startDate = calendar.startOfDay(for: startDate)
        
        if let end = endDate {
            self.endDate = calendar.startOfDay(for: end)
            self.durationInDays = calendar.dateComponents([.day], from: self.startDate, to: self.endDate).day!
        } else if let duration = durationInDays {
            self.durationInDays = duration
            self.endDate = calendar.date(byAdding: .day, value: duration, to: self.startDate)!
        } else {
            self.durationInDays = 21
            self.endDate = calendar.date(byAdding: .day, value: 21, to: self.startDate)!
        }
        
        self.scheduledDates = frequency.generateDates(
            start: self.startDate,
            end: self.endDate
        )
    }
}

