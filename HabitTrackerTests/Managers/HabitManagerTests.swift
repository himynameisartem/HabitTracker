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
    
    func testMarkHabitAsDone() {
        let habit = Habit(title: "Foo")
        sut.addHabit(habit)
        
    }
    
}
