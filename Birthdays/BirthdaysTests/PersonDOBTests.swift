//
//  PersonDOBTests.swift
//  BirthdaysTests
//
//  Created by David Norris on 28/03/2022.
//

import XCTest
@testable import Birthdays

class PersonDOBTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyDate() throws {
        let dob = DOB()
        XCTAssertEqual(dob.date!.count, 0, "No Date")
    }

    func testEmptyAge() throws {
        let dob = DOB()
        XCTAssertEqual(dob.age, 0, "Age shouldn't be zero")
    }
    
}
