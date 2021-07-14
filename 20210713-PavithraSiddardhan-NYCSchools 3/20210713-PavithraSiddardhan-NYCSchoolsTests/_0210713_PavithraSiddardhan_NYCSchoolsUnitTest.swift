//
//  _0210713_PavithraSiddardhan_NYCSchoolsUnitTest.swift
//  20210713-PavithraSiddardhan-NYCSchoolsTests
//
//  Created by Pavithra Siddardhan on 14/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import XCTest
@testable import _0210713_PavithraSiddardhan_NYCSchools

// MARK: - _0210713_PavithraSiddardhan_NYCSchoolsUnitTest - EVALUATING SCHOOL DETAILS IF PRESENT

class _0210713_PavithraSiddardhan_NYCSchoolsUnitTest: XCTestCase {
    
    
    // MARK: - INSTANCE OPTIONAL PROPERTIES
    
    var satSchool : NYCSATSchoolss?
    
    // MARK: - SET UP METHODS CALLED BEFORE EXECUTION OF EACH TEST CASE
    override func setUp() {
        satSchool = NYCSATSchoolss(schoolName: "Phoneix City School", city: "Phoneix", grade: "6-12")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    // MARK: - TEST METHODS CALLED DURING EXECUTION OF TEST CASE , SHOULD START ONLY WITH WORD TEST
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(satSchool?.city)
        XCTAssertNotNil(satSchool?.finalGrades)
        XCTAssertNotNil(satSchool?.schoolName)
    }
    
    // MARK: - TEAR DOWN METHODS CALLED AFTER EXECUTION OF EACH TEST CASE
    override func tearDown() {
        satSchool = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

// MARK: - CLASS - TO TEST UNIT TEST CASES

class NYCSATSchoolss  {
    
    // MARK: -INSTANCE PROPERTIES
    let schoolName,city,finalGrades : String
    // MARK: -INITIALISER
    init (schoolName:String, city:String, grade:String) {
        self.schoolName = schoolName
        self.city = city
        self.finalGrades = grade
    }
    
    
}
