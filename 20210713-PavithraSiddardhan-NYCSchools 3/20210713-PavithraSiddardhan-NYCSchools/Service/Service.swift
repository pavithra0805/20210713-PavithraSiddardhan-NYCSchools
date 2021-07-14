//
//  Service.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 13/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import Foundation

// MARK: - CLASS - Services - TO WRITE SERVICE CALL FOR SCHOOLS AND SCORES URL
class Service {
    
    
    //lAZY VARIBLES _
    lazy var sessionConfig = URLSessionConfiguration.default
    lazy var urlSession = URLSession(configuration: self.sessionConfig)
    
    
    // MARK: - INSTANCE METHODS
    
    //METHOD FOR NYCSCHOOL DETAILS API
    func downloadNYCData(_ completion : @escaping (([NYCSchools]) -> ())) {
        if let sourceUrlNYC = URL(string:"https://data.cityofnewyork.us/resource/s3k6-pzi2.json"){
            let urlRequest = URLRequest(url: sourceUrlNYC)
            let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
                if (error == nil) {
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let empData = try jsonDecoder.decode([NYCSchools].self, from: data)
                        completion(empData)
                    }
                    catch let error {
                        _ = error.localizedDescription
                    }
                }
                }
            }
            dataTask.resume()
        }
    }
    
    //METHOD FOR NYC SAT SCORES DETAILS API
    func downloadNYCScoreData(_ completion : @escaping (([NYCSATScores]) -> ())) {
        if let sourceUrlNYCScore = URL(string:"https://data.cityofnewyork.us/resource/f9bf-2cp4.json"){
            let urlRequest = URLRequest(url: sourceUrlNYCScore)
            let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
                if (error == nil) {
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let empData = try jsonDecoder.decode([NYCSATScores].self, from: data)
                        completion(empData)
                    }
                    catch let error {
                        _ = error.localizedDescription
                    }
                }
                }
            }
            dataTask.resume()
        }
    }
    
}


