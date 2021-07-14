//
//  NYCSatScores.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 13/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import Foundation
// MARK: - STRUCT - NYCSATScores - MODEL FOR NYCScoresVC
struct NYCSATScores : Decodable {
    
    // MARK: -INSTANCE PROPERTIES OF NYCSATScores
    let strReadScore,strWriteScore,strMathScore,strSchoolName,strSatTakersCount : String
    
    //ENUM MATCHES - JSON SPECIFICATION TO PROPERIES OF STRUCT
    enum CodingKeys : String,CodingKey {
        case strReadScore = "sat_critical_reading_avg_score"
        case strWriteScore = "sat_writing_avg_score"
        case strMathScore = "sat_math_avg_score"
        case strSchoolName = "school_name"
        case strSatTakersCount = "num_of_sat_test_takers"
    }
    
    
}
