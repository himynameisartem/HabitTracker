//
//  HabitManagerTests.swift
//  HabbitTrackerTests
//
//  Created by Артем Кудрявцев on 09.07.2025.
//

import XCTest
@testable import HabitTracker

class HabitManagerTests: XCTestCase {
    
    var sut: HabitManager!

    override func setUp() {
        super.setUp()
        sut = HabitManager()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInitHabitManagerWithZeroHabit() {
        XCTAssertEqual(sut.habits.count, 0)
    }
    
    func testAddHabitIncrementHabitsCount() {
        let habit = Habit(title: "Foo")
        sut.addHabit(habit)
        XCTAssertEqual(sut.habits.count, 1)
    }
    
    func testHabitAtIndexIsAddedHabit() {
        let habit = Habit(title: "Foo")
        sut.addHabit(habit)
        let returnedHabit = sut.habit(at: 0)
        XCTAssertEqual(habit.title, returnedHabit.title)
    }
    
    func testDoneHabitAtIndexIsMarkedAsDone() {
        var habit = Habit(title: "Foo")
        habit.durationInDays = 1
        sut.addHabit(habit)
        sut.markDoneToday(at: 0, for: Date())
        XCTAssertEqual(sut.habits.count, 0)
    }
    
    func testDoneHabitWhenMarkAllComletionDates() {
        var habit = Habit(title: "Foo")
        habit.durationInDays = 1
        sut.addHabit(habit)
        sut.markDoneToday(at: 0, for: Date())
        XCTAssertEqual(sut.comletedHabits.count, 1)
    }
}
