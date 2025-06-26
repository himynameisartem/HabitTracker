//
//  WeekdayTests.swift
//  HabbitTrackerTests
//
//  Created by Артем Кудрявцев on 26.06.2025.
//

import XCTest
@testable import HabbitTracker

class WeekdayTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitWeekday() {
        let weekday = Weekday.monday
        XCTAssertNotNil(weekday)
    }
    
    func testWhenGivenWeekdaySetsWeekday() {
        let weekday  = Weekday.friday
        XCTAssertEqual(weekday, Weekday.friday)
    }
}
