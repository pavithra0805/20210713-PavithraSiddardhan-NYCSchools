//
//  _0210713_PavithraSiddardhan_NYCSchoolsTests.swift
//  20210713-PavithraSiddardhan-NYCSchoolsTests
//
//  Created by Pavithra Siddardhan on 14/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import XCTest
@testable import _0210713_PavithraSiddardhan_NYCSchools

// MARK: - _0210713_PavithraSiddardhan_NYCSchoolsTests - PASSING SCORES, SCHOOLS DATA, TEST TAKERS COUNT, EVALUATING SKILL LEVEL

class _0210713_PavithraSiddardhan_NYCSchoolsTests: XCTestCase {
    
    // MARK: - INSTANCE OPTIONAL PROPERTIES
    var satScores : NYCSATScoress?
    var skillLevel : String?
    
    // MARK: - SET UP METHODS CALLED BEFORE EXECUTION OF EACH TEST CASE
    override func setUp() {
        satScores = NYCSATScoress(readScore: "300", writeScore: "300", mathScore: "300", schoolName: "Phoenix School", testTakerCount: "12")
        skillLevel = satScores?.detemineSkillLevel()
    }
    
    // MARK: - TEAR DOWN METHODS CALLED AFTER EXECUTION OF EACH TEST CASE
    
    override func tearDown() {
        satScores = nil
        skillLevel = nil
    }
    
    // MARK: - TEST METHODS CALLED DURING EXECUTION OF TEST CASE , SHOULD START ONLY WITH WORD TEST
    
    func testScores() {
        XCTAssertNotNil(satScores?.strMathScore)
        XCTAssertNotNil(satScores?.strSchoolName)
        XCTAssertNotNil(satScores?.strReadScore)
        XCTAssertNotNil(satScores?.strSatTakersCount)
        XCTAssertNotNil(satScores?.strWriteScore)
        XCTAssertTrue(skillLevel == "SKILL LEVEL:  High" || skillLevel == "SKILL LEVEL:  Intermediate" || skillLevel == "SKILL LEVEL : low")
        XCTAssert(skillLevel == "SKILL LEVEL:  High" || skillLevel == "SKILL LEVEL:  Intermediate" || skillLevel == "SKILL LEVEL : low", ("SKILL : \(skillLevel ?? "No scores")"))
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
}


// MARK: - CLASS - TO TEST UNIT TEST CASES
class NYCSATScoress  {
    
    // MARK: -INSTANCE PROPERTIES
    let strReadScore,strWriteScore,strMathScore,strSchoolName,strSatTakersCount : String
    
    // MARK: -INITIALISER
    init (readScore:String,writeScore:String,mathScore:String,schoolName:String,testTakerCount:String) {
        self.strMathScore = mathScore
        self.strReadScore = readScore
        self.strSatTakersCount = testTakerCount
        self.strWriteScore = writeScore
        self.strSchoolName = schoolName
    }
    
    // MARK: -INSTANCE METHOD TO RETURN SKILL LEVEL - IMPLEMENTS SWITCH
    func detemineSkillLevel() -> String{
        if let mathScore = Int(strMathScore), let readScore = Int(strReadScore), let writeScore = Int(strWriteScore),let nSatTaker = Int(strSatTakersCount) {
            let skillScore = (mathScore + readScore + writeScore) / nSatTaker
            switch skillScore {
            case 50...:
                return "SKILL LEVEL:  High"
            case 25...50:
                return  "SKILL LEVEL:  Intermediate"
            default:
                return "SKILL LEVEL : low"
            }
        }
        return ""
    }
    
}


