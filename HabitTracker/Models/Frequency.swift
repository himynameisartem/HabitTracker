//
//  Frequency.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

enum Frequency: Equatable {
    case daily
    case weekly(days: [Weekday])
    case custom(daysInterval: Int)
    
    func generateDates(start: Date, end: Date) -> [Date] {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        guard start <= end else { return [] }
        
        let normalizedStart = calendar.startOfDay(for: start)
        let normalizedEnd = calendar.startOfDay(for: end)
        
        switch self {
        case .daily:
            return generateByStep(start: normalizedStart, end: normalizedEnd, step: 1, calendar: calendar)
        case .custom(let daysInterval):
            let step = max(1, daysInterval)
            return generateByStep(start: normalizedStart, end: normalizedEnd, step: step, calendar: calendar)
        case .weekly(let weekdays):
            return generateWeeklyBetween(start: normalizedStart, end: normalizedEnd, weekdays: weekdays, calendar: calendar)
        }
    }
}

extension Frequency {
    private func generateByStep(start: Date, end: Date, step: Int, calendar: Calendar) -> [Date] {
        var result: [Date] = []
        var current = start
        while current <= end {
            result.append(current)
            guard let next = calendar.date(byAdding: .day, value: step, to: current) else { break }
            current = next
        }
        return result
    }
    
    private func generateWeeklyBetween(start: Date, end: Date, weekdays: [Weekday], calendar: Calendar) -> [Date] {
        guard !weekdays.isEmpty else { return [] }
        var result: [Date] = []
        let sortedWeekdays = Array(Set(weekdays)).sorted { $0.rawValue < $1.rawValue }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        for i in sortedWeekdays {
            var dateComponents = DateComponents()
            dateComponents.weekday = i.rawValue
            dateComponents.timeZone = calendar.timeZone
            let searchAfter = calendar.date(byAdding: .second, value: -1, to: start) ?? start
            guard let first = calendar.nextDate(after: searchAfter, matching: dateComponents, matchingPolicy: .nextTimePreservingSmallerComponents) else {
                continue
            }
            var occurrence = first
            var count = 0
            while occurrence <= end && count < 10 {
                result.append(occurrence)
                guard let next = calendar.date(byAdding: .day, value: 7, to: occurrence) else {
                    break
                }
                occurrence = next
                count += 1
            }
        }
        return result.sorted()
    }
}

