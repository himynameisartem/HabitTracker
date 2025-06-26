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
}
