//
//  Habit.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

struct Habit {
    let title: String
    let description: String?
    let startDate: Date
    
    init(title: String, description: String? = nil, startDate: Date = Date()) {
        self.title = title
        self.description = description
        self.startDate = startDate
    }
}

