//
//  HabitTests.swift
//  HabitTests
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import XCTest
@testable import HabbitTracker

class HabitTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitHabitWithTitle() {
        let title = "Foo"
        let habit = Habit(title: title)
        XCTAssertNotNil(habit)
    }
    
    func testInitHabitWithTitleAndDescription() {
        let title = "Foo"
        let description = "Bar"
        let habit = Habit(title: title, description: description)
        XCTAssertNotNil(habit)
    }
    
    func testWheGivenTitleSetsTitle() {
        let title = "Foo"
        let habit = Habit(title: title)
        XCTAssertEqual(habit.title, title)
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let description = "Bar"
        let habit = Habit(title: "Foo", description: description)
        XCTAssertEqual(habit.description, description)
    }
    
    func testInitHabitWithDate() {
        let date = Date()
        let habit = Habit(title: "Foo", startDate: date)
        XCTAssertNotNil(habit)
    }
    
    func testWhenGivenDateSetsDate() {
        let date = Date()
        let habit = Habit(title: "Foo", startDate: date)
        XCTAssertEqual(habit.startDate, date)
    }
    
    func testInitHabitWithFrequency() {
        let frequency = Frequency.daily
        let habit = Habit(title: "Foo", frequency: frequency)
        XCTAssertNotNil(habit)
    }
    
    func testWhenGivenFrequencySetsFrequency() {
        let frequency: Frequency = .weekly(days: [Weekday.friday, Weekday.sunday])
        let habit = Habit(title: "Foo", frequency: frequency)
        XCTAssertEqual(habit.frequency, frequency)
    }
    
    func testMarkComletedAddsDate() {
        var habit = Habit(title: "Foo")
        let date = Date()
        habit.markCompleted(on: date)
        XCTAssertTrue(habit.isComplete(on: date))
    }
    
    func testMarkCompletedDoesNotAddDuplicateDates() {
        var habit = Habit(title: "Foo")
        let date = Date()
        habit.markCompleted(on: date)
        habit.markCompleted(on: date)
        XCTAssertEqual(habit.completionDates.count, 1)
    }
    
    func testWhenIsComletedReturnsTrue() {
        var habit = Habit(title: "Foo")
        habit.markCompleted()
        XCTAssertTrue(habit.isComplete())
    }
    
    func testWhenIsComleteReturnsFalse() {
        let habit = Habit(title: "Foo")
        XCTAssertFalse(habit.isComplete())
    }
    
    func testUnmarkComletedRemovesDate() {
        var habit = Habit(title: "Foo")
        let date = Date()
        habit.markCompleted(on: date)
        habit.unmarkCompleted(on: date)
        XCTAssertFalse(habit.isComplete(on: date))
    }
    
    func testUnmarkCompletedDoesNothingIfDateDoesNotExist() {
        var habit = Habit(title: "Foo")
        habit.unmarkCompleted(on: Date())
        XCTAssertFalse(habit.isComplete())
    }
    
    func testMarkAndCheckPreviousDate() {
        var habit = Habit(title: "Foo")
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let today = Date()
        habit.markCompleted(on: yesterday)
        XCTAssertTrue(habit.isComplete(on: yesterday))
        XCTAssertFalse(habit.isComplete(on: today))
    }
    
    func testWhenGivenColorSetsColor() {
        var habit = Habit(title: "Foo")
        let color = "#FFFFFF"
        habit.colorHex = color
        XCTAssertEqual(habit.colorHex, color)
    }
    
    func testWhenGivenDurationInDaysSetsDurationInDays() {
        var habit = Habit(title: "Foo")
        let durationInDays = 30
        habit.durationInDays = durationInDays
        XCTAssertEqual(habit.durationInDays, durationInDays)
    }
    
    func testCompletedDaysCount() {
        var habit = Habit(title: "Foo")
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let today = Date()
        habit.markCompleted(on: yesterday)
        habit.markCompleted(on: today)
        XCTAssertEqual(habit.completedDaysCount(), 2)
    }
    
    func testDaysLeft() {
        var habit = Habit(title: "Foo")
        let duration = 30
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let dayBeforeYesterday = Calendar.current.date(byAdding: .day, value: -1, to: yesterday)!
        habit.durationInDays = duration
        habit.markCompleted(on: dayBeforeYesterday)
        habit.markCompleted(on: yesterday)
        habit.markCompleted(on: today)
        XCTAssertEqual(habit.daysLeft(), 27)
    }
    
    func testIsCompleted() {
        var habit = Habit(title: "Foo")
        let duration = 3
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let dayBeforeYesterday = Calendar.current.date(byAdding: .day, value: -1, to: yesterday)!
        habit.durationInDays = duration
        habit.markCompleted(on: dayBeforeYesterday)
        habit.markCompleted(on: yesterday)
        habit.markCompleted(on: today)
        XCTAssertTrue(habit.isCompleted())
    }
}
