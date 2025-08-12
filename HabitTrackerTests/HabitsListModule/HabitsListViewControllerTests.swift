//
//  HabitsListViewControllerTests.swift
//  HabitTrackerTests
//
//  Created by Artem Kudryavtsev on 12.08.2025.
//

import XCTest
@testable import HabitTracker

class HabitsListViewControllerTests: XCTestCase {
    
    var sut: HabitsListViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = HabitsListViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGivenNavigationTitleIsEmptyWhenViewIsLoaded() {
        XCTAssertEqual(sut.navigationItem.title, "Habits")
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.habitsListTableView)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.habitsListTableView.delegate is HabitsListViewController)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.habitsListTableView.dataSource is HabitsListViewController)
    }
    
    
}
