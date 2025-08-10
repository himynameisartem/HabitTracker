//
//  HabitTests.swift
//  HabitTests
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import XCTest
@testable import HabitTracker

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
    
    func testCompletionDatesAddedDate() {
        var habit = Habit(title: "Foo")
        habit.addComletionDate(Date())
        XCTAssertEqual(habit.completionDates.count, 1)
    }
    
    func testComletionDatesAddedSameDate() {
        var habit = Habit(title: "Foo")
        let calendar = Calendar.current
        let components = DateComponents(year: 2025, month: 7, day: 29)
        let date = calendar.date(from: components)!
        let date2 = calendar.date(from: components)!
        habit.addComletionDate(Date())
        habit.addComletionDate(Date())
        habit.addComletionDate(Date())
        habit.addComletionDate(date)
        habit.addComletionDate(date2)
        XCTAssertEqual(habit.completionDates.count, 2)
    }
    
    func testEndDateWhenGivenDurationInDays() {
        var components = DateComponents()
        components.year = 2025
        components.month = 9
        components.day = 1
        guard let endDate = Calendar.current.date(from: components) else { return }
        let habit = Habit(title: "Foo", durationInDays: 22)
        XCTAssertTrue(habit.endDate.isSameDay(as: endDate))
    }
    
    func testDurationInDaysWhenGivenEndDate() {
        var components = DateComponents()
        components.year = 2025
        components.month = 9
        components.day = 2
        guard let endDate = Calendar.current.date(from: components) else { return }
        let habit = Habit(title: "Foo", endDate: endDate)
        XCTAssertEqual(habit.durationInDays, 22)
    }
    
    func testEndDateWhenGivenDeafultDurationInDays() {
        var components = DateComponents()
        components.year = 2025
        components.month = 8
        components.day = 31
        guard let endDate = Calendar.current.date(from: components) else { return }
        let habit = Habit(title: "Foo")
        XCTAssertTrue(habit.endDate.isSameDay(as: endDate))
    }
    
    
    func testShesuledDatesWhenGivenFrequency() {
        let habit = Habit(title: "foo", frequency: .weekly(days: [.monday, .wednesday, .friday]), durationInDays: 30)
        print(habit.scheduledDates)
        XCTAssertEqual(habit.scheduledDates.count, 13)
    }
}
