//
//  HabitManager.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 09.07.2025.
//

import Foundation

class HabitManager {
    
    private(set) var habits: [Habit] = []
    private(set) var comletedHabits: [Habit] = []
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
    
    func habit(at index: Int) -> Habit {
        return habits[index]
    }
    
    func markDoneToday(at index: Int, for date: Date) {
        habits[index].addComletionDate(date)
        if habits[index].completionDates.count == habits[index].durationInDays {
            let comletedHabit = habits.remove(at: index)
            comletedHabits.append(comletedHabit)
        }
    }
}
