//
//  PersonNameTests.swift
//  PersonNameTests
//
//  Created by David Norris on 28/03/2022.
//

import XCTest
@testable import Birthdays

class PersonNameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyTitle() throws {
        let name = Name()
        XCTAssertEqual(name.title?.count, 0, "No Title")
    }

    func testEmptyFirstName() throws {
        let name = Name()
        XCTAssertEqual(name.first?.count, 0, "No First Name")
    }
    
    func testEmptyLastName() throws {
        let name = Name()
        XCTAssertEqual(name.last?.count, 0, "No Last Name")
    }
    
    func testFullName() throws {
        let name = Name(title: "Mr", first: "Tony", last: "Stark")
        XCTAssertEqual(name.fullName, "Tony Stark")
    }
    
    func testEmptyFullName() throws {
        let name = Name()
        XCTAssertEqual(name.fullName.count, 1, "No Fullname")
    }

}
