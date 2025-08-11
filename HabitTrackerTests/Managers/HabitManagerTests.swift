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
    var calendar: Calendar!

    override func setUp() {
        super.setUp()
        sut = HabitManager()
        calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        calendar = nil
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
        guard let returnedHabit = sut.habit(at: 0) else { return }
        XCTAssertEqual(habit.title, returnedHabit.title)
    }
    
    func testDoneHabitAtIndexIsMarkedAsDone() {
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))
        let today = calendar.startOfDay(for: Date())
        let habit = Habit(title: "Foo", frequency: .weekly(days: [.monday, .wednesday]))
        sut.addHabit(habit)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow!)
        print(sut.habits[0].completionDates)
        XCTAssertTrue(sut.habits[0].completionDates.contains(today))
        XCTAssertFalse(sut.habits[0].completionDates.contains(tomorrow!))
    }
    
    func testCompleteHabitsWhenGivenMarkHabitAllDates() {
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))
        let today = calendar.startOfDay(for: Date())
        let habit = Habit(title: "Foo", frequency: .weekly(days: [.monday, .tuesday]), durationInDays: 5)
        sut.addHabit(habit)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow!)
        XCTAssertEqual(sut.comletedHabits.count, 1)
        XCTAssertTrue(sut.habits.isEmpty)
        guard let returnedHabit = sut.completedHabit(at: 0) else { return }
        XCTAssertEqual(sut.comletedHabits[0], returnedHabit)
    }
    
    func testUnmarkDoneAtIndexIsMarkedAsNotDone() {
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))!
        let dayAfterTomorrow = calendar.date(byAdding: .day, value: 2, to: calendar.startOfDay(for: Date()))!
        let today = calendar.startOfDay(for: Date())
        let habit = Habit(title: "Foo", frequency: .daily, durationInDays: 5)
        sut.addHabit(habit)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow)
        sut.markDoneToday(at: 0, for: dayAfterTomorrow)
        sut.unmarkDone(at: 0, for: dayAfterTomorrow)
        XCTAssertFalse(sut.habits[0].completionDates.contains(dayAfterTomorrow))
    }
    
    func testHsbitdCountWhenGivenUnmarkCompletedHabit() {
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))!
        let dayAfterTomorrow = calendar.date(byAdding: .day, value: 2, to: calendar.startOfDay(for: Date()))!
        let habit = Habit(title: "Foo", frequency: .daily, durationInDays: 2)
        sut.addHabit(habit)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow)
        sut.markDoneToday(at: 0, for: dayAfterTomorrow)
        XCTAssertTrue(sut.habits.isEmpty)
        XCTAssertEqual(sut.comletedHabits.count, 1)
        sut.unmarkDone(at: 0, for: tomorrow)
        XCTAssertEqual(sut.habits.count, 1)
        XCTAssertTrue(sut.comletedHabits.isEmpty)
    }
    
    func testHabitsCoutWhenDeleteHabit() {
        let habit1 = Habit(title: "Foo")
        let habit2 = Habit(title: "Bar")
        sut.addHabit(habit1)
        sut.addHabit(habit2)
        sut.deleteHabit(at: 1)
        XCTAssertEqual(sut.habits.count, 1)
    }
    
    func testComletedHabitsCountWhenDeleteComletedHabit() {
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))!
        let dayAfterTomorrow = calendar.date(byAdding: .day, value: 2, to: calendar.startOfDay(for: Date()))!
        let habit1 = Habit(title: "Foo", durationInDays: 2)
        let habit2 = Habit(title: "Bar", durationInDays: 2)
        sut.addHabit(habit1)
        sut.addHabit(habit2)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow)
        sut.markDoneToday(at: 0, for: dayAfterTomorrow)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow)
        sut.markDoneToday(at: 0, for: dayAfterTomorrow)
        sut.deleteCompletedHabit(at: 1)
        XCTAssertEqual(sut.comletedHabits.count, 1)
        XCTAssertTrue(sut.habits.isEmpty)
    }
    
    func testHabitsAndCompletedHabitsIncrementWhenRemoveAll() {
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))!
        let dayAfterTomorrow = calendar.date(byAdding: .day, value: 2, to: calendar.startOfDay(for: Date()))!
        let habit1 = Habit(title: "Foo", durationInDays: 2)
        let habit2 = Habit(title: "Bar", durationInDays: 2)
        sut.addHabit(habit1)
        sut.addHabit(habit2)
        sut.markDoneToday(at: 0, for: today)
        sut.markDoneToday(at: 0, for: tomorrow)
        sut.markDoneToday(at: 0, for: dayAfterTomorrow)
        XCTAssertEqual(sut.habits.count, 1)
        XCTAssertEqual(sut.comletedHabits.count, 1)
        sut.removeAll()
        XCTAssertTrue(sut.habits.isEmpty)
        XCTAssertTrue(sut.comletedHabits.isEmpty)
    }
}
