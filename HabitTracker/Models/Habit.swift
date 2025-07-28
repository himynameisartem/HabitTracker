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
    }
    
    mutating func addComletionDate(_ date: Date) {
        if !completionDates.contains(where: {$0.isSameDay(as: date)}) &&
            completionDates.count < durationInDays {
                completionDates.append(date)
            }
        print(completionDates)
    }
}
