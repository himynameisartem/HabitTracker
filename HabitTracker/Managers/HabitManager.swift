//
//  HabitManager.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 09.07.2025.
//

import Foundation

class HabitManager {
    
    private(set) var habits: [Habit] = []
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
}
