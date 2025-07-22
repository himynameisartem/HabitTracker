//
//  FrequencyTests.swift
//  HabitTrackerTests
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import XCTest
@testable import HabitTracker

class FrequencyTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFrequencyWithDaily() {
        let frequency = Frequency.daily
        XCTAssertNotNil(frequency)
    }
    
    func testWhenGivenFrequencySetsFrequency() {
        let frequency: Frequency = .daily
        XCTAssertEqual(frequency, Frequency.daily)
    }
    
    func testInitFrequencyWithWeekly() {
        let frequency = Frequency.weekly(days: [Weekday.monday, Weekday.friday])
        XCTAssertNotNil(frequency)
    }
    
    func testWhenGivetWeeklySetsWeekly() {
        let weekly: [Weekday] = [.monday, .friday]
        let frequency: Frequency = .weekly(days: weekly)
        XCTAssertEqual(frequency, .weekly(days: weekly))
    }
    
    func testInitFrequencyWithCustom() {
        let custom = Frequency.custom(daysInterval: 3)
        XCTAssertNotNil(custom)
    }
    
    func testWhenGivenCustomSetsCustom() {
        let custom: Int = 5
        let frequency: Frequency = .custom(daysInterval: custom)
        XCTAssertEqual(frequency, .custom(daysInterval: custom))
    }
}
