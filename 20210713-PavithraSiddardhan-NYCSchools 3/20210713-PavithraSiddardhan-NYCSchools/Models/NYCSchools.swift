//
//  NYCSchools.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 13/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import Foundation

// MARK: - STRUCT - NYCSchools - MODEL FOR NYCSchoolVC
struct NYCSchools : Decodable {
    
    // MARK: -INSTANCE PROPERTIES OF NYCSCHOOLS
    let schoolName,city,finalGrades : String
    
    //ENUM MATCHES - JSON SPECIFICATION TO PROPERIES OF STRUCT
    enum CodingKeys : String,CodingKey {
        case schoolName = "school_name"
        case city = "city"
        case finalGrades = "finalgrades"
    }
    
}

