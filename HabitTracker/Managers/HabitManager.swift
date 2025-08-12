//
//  HabitManager.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 09.07.2025.
//

import Foundation

final class HabitManager {
    
    private var calendar = Calendar.current
    
    private(set) var habits: [Habit] = []
    private(set) var comletedHabits: [Habit] = []
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
    
    func habit(at index: Int) -> Habit? {
        if habits.count > index  {
            return habits[index]
        }
        return nil
    }
    
    func completedHabit(at index: Int) -> Habit? {
        if comletedHabits.count > index  {
            return comletedHabits[index]
        }
        return nil
    }
    
    func markDoneToday(at index: Int, for date: Date) {
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let normalizedDate = calendar.startOfDay(for: date)
        if habits.count > index {
            if !habits[index].completionDates.contains(where: {$0.isSameDay(as: normalizedDate)}) &&
                habits[index].scheduledDates.contains(where: {$0.isSameDay(as: normalizedDate)}) && habits[index].completionDates.count <= habits[index].durationInDays {
                habits[index].completionDates.append(normalizedDate)
            }
            
            if habits[index].scheduledDates == habits[index].completionDates {
                comletedHabits.append(habits.remove(at: index))
            }
        }
    }
    
    func unmarkDone(at index: Int, for date: Date) {
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let normalizedDate = calendar.startOfDay(for: date)
        let habit = habit(at: index)
        let comletedHabit = completedHabit(at: index)
        
        if habits.contains(where: {$0 == habit }) {
            if let indexOfDate = habits[index].completionDates.firstIndex(of: normalizedDate) {
                habits[index].completionDates.remove(at: indexOfDate)
            }
        } else if comletedHabits.contains(where: {$0 == comletedHabit }) {
            if let indexOfDate = comletedHabits[index].completionDates.firstIndex(of: normalizedDate) {
                comletedHabits[index].completionDates.remove(at: indexOfDate)
                
                if comletedHabits[index].scheduledDates != comletedHabits[index].completionDates {
                    habits.append(comletedHabits.remove(at: index))
                }
            }
        }
    }
    
    func deleteHabit(at index: Int) {
        if habits.count > index {
            habits.remove(at: index)
        }
    }
    
    func deleteCompletedHabit(at index: Int) {
        if comletedHabits.count > index {
            comletedHabits.remove(at: index)
        }
    }
    
    func removeAll() {
        habits.removeAll()
        comletedHabits.removeAll()
    }
}
