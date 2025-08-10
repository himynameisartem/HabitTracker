//
//  Date+Extension.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 28.07.2025.
//

import Foundation

extension Date {
    func isSameDay(as other: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: other)
    }
}
