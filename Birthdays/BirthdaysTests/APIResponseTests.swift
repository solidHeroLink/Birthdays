//
//  APIResponseTests.swift
//  BirthdaysTests
//
//  Created by David Norris on 28/03/2022.
//

import XCTest
@testable import Birthdays

class APIResponseTests: XCTestCase {
    
    let response = Response(results: [
        Person(name: Name(title: "Mr", first: "Tony", last: "Stark"), dob: DOB(date: "1970-05-29", age: 48)),
        Person(name: Name(title: "Mr", first: "Peter", last: "Parker"), dob: DOB(date: "2001-08-10", age: 18)),
        Person(name: Name(title: "Mrs", first: "Natasha", last: ""), dob: DOB(date: "1984-12-03", age: 32)),
    ])

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyResponse() throws {
        let response = Response()
        XCTAssertEqual(response.results.count, 0, "No Results Found")
    }
    
    func testResponse() throws {
        XCTAssertEqual(response.results.count, 3, "3 Results Found")
    }
    
    func testResponseFullName() throws {
        XCTAssertEqual(response.results[0].name.fullName, "Tony Stark", "First Person is Tony Stark")
        XCTAssertEqual(response.results[1].name.fullName, "Peter Parker", "Second Person is Peter Parker")
        XCTAssertEqual(response.results[2].name.fullName, "Natasha", "Third Person is Natasha")
    }
    
    func testResponseInitials() throws {
        XCTAssertEqual(response.results[0].name.fullName.initials, "TS", "First Person is TS")
        XCTAssertEqual(response.results[1].name.fullName.initials, "PP", "Second Person is PP")
        XCTAssertEqual(response.results[2].name.fullName.initials, "N", "Third Person is N")
    }
    
    func testResponseDoB() throws {
        XCTAssertEqual(response.results[0].dob.birthday, "29-05-1970", "First Person is born 29/05/1970")
        XCTAssertEqual(response.results[1].dob.birthday, "10-08-2001", "Second Person is born 10/08/2001")
        XCTAssertEqual(response.results[2].dob.birthday, "03-12-1984", "Third Person is born 03/12/1984")
    }
    
    func testResponseAge() throws {
        XCTAssertEqual(response.results[0].dob.age, 48, "First Person is 48")
        XCTAssertEqual(response.results[1].dob.age, 18, "Second Person is 18")
        XCTAssertEqual(response.results[2].dob.age, 32, "Third Person is 32")
    }
    
    func testResponseAgeYearsOld() throws {
        XCTAssertEqual(response.results[0].dob.yearsOld, "48 YEARS OLD")
        XCTAssertEqual(response.results[1].dob.yearsOld, "18 YEARS OLD")
        XCTAssertEqual(response.results[2].dob.yearsOld, "32 YEARS OLD")
    }

}
