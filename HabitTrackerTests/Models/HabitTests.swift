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
}
