//
//  HabitManagerTests.swift
//  HabbitTrackerTests
//
//  Created by Артем Кудрявцев on 09.07.2025.
//

import XCTest
@testable import HabbitTracker

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
    
    func testHabitCountIsZero() {
        XCTAssertEqual(sut.totalHabitCount, 0)
    }
    
    func testTodayHabitCountIsZero() {
        XCTAssertEqual(sut.todayHabitCount , 0)
    }
    
    func testTodayHabitDoneCountIsZero() {
        XCTAssertEqual(sut.todayHabitDoneCount, 0)
    }
}
