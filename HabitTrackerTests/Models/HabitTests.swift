//
//  HabitTests.swift
//  HabitTests
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import XCTest
@testable import HabitTracker

class HabitTests: XCTestCase {
    var calendar: Calendar!
    override func setUp() {
        super.setUp()
        calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
    }
    
    override func tearDown() {
        calendar = nil
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
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let date = calendar.startOfDay(for: Date())
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
    
    func testWhenGivenCompetionDatesSetsCompletionDates() {
        let completionDates: [Date] = [Date()]
        let habit = Habit(title: "Foo", completionDates: completionDates)
        XCTAssertEqual(habit.completionDates, completionDates)
    }
    
    func testEndDateWhenGivenDurationInDays() {
        let endDate = calendar.date(byAdding: .day, value: 22, to: calendar.startOfDay(for: Date()))!
        let habit = Habit(title: "Foo", durationInDays: 22)
        XCTAssertTrue(habit.endDate.isSameDay(as: endDate))
    }
    
    func testDurationInDaysWhenGivenEndDate() {
        let endDate = calendar.date(byAdding: .day, value: 22, to: calendar.startOfDay(for: Date()))!
        let habit = Habit(title: "Foo", endDate: endDate)
        XCTAssertEqual(habit.durationInDays, 22)
    }
    
    func testEndDateWhenGivenDeafultDurationInDays() {
        let endDate = calendar.date(byAdding: .day, value: 21, to: calendar.startOfDay(for: Date()))!
        let habit = Habit(title: "Foo")
        XCTAssertTrue(habit.endDate.isSameDay(as: endDate))
    }
    
    func testShesuledDatesWhenGivenFrequencyByWeekday() {
        let habit = Habit(title: "foo", frequency: .weekly(days: [.monday, .wednesday, .friday]), durationInDays: 30)
        XCTAssertEqual(habit.scheduledDates.count, 14)
    }
    
    func testShedulesDatesWhenGivenFrequencyByCustom() {
        let habit = Habit(title: "foo", frequency: .custom(daysInterval: 3), durationInDays: 30)
        XCTAssertEqual(habit.scheduledDates.count, 11)
    }
    
    func testShedulesDatesWhenGivenFrequencyByDefault() {
        let habit = Habit(title: "foo", durationInDays: 30)
        XCTAssertEqual(habit.scheduledDates.count, 31)
    }
    
    func testGenerateWeeklyBetweenWhenGivenEmptyWeekdays() {
        let habit = Habit(title: "foo",frequency: Frequency.weekly(days: []), durationInDays: 30)
        XCTAssertTrue(habit.scheduledDates.isEmpty)
    }
}
