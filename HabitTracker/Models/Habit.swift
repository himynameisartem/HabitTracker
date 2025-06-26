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
    
    mutating func markCompleted(on date: Date = Date()) {
        let normolized = Calendar.current.startOfDay(for: date)
        if !completionDates.contains(normolized) {
            completionDates.append(normolized)
        }
    }
    
    mutating func unmarkCompleted(on date: Date = Date()) {
        let normolized = Calendar.current.startOfDay(for: date)
        if let index = completionDates.firstIndex(of: normolized) {
            completionDates.remove(at: index)
        }
    }
    
    func isComplete(on date: Date = Date()) -> Bool {
        let normolized = Calendar.current.startOfDay(for: date)
        return completionDates.contains(normolized)
    }
    
    func completedDaysCount() -> Int {
        return completionDates.count
    }
    
    func daysLeft() -> Int {
        return max(durationInDays - completedDaysCount(), 0)
    }
    
    func isCompleted() -> Bool {
        return completedDaysCount() >= durationInDays
    }
}

