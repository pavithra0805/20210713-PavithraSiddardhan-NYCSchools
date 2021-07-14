//
//  NYCSatScoreViewModel.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 14/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import Foundation

// MARK: - CLASS - NYCSatScoreViewModel - VIEWMODEL FOR NYCScoresVC
class NYCSatScoreViewModel {
    
    // MARK: - INSTANCE PROPERTIES
    
    //private properties
    private var apiScoreService : Service?
    private var selectedSchool : String?
    private var arrScores = [NYCSATScores]()
    
    //weak properties
    weak var nycVC : NYCScoresVC?
    
    //other properties
    var arrNYCScoreViewModel = [NYCSatScoreViewModel]()
    var strWriteScore : String?
    var strMathScore : String?
    var strSchoolName : String?
    var strSatTakersCount : String?
    var strReadScore : String?
    
    //INITIALIZER
    init(selectedSchool:String) {
        apiScoreService =  Service()
        self.selectedSchool = selectedSchool
        callDownloadNYCScores()
    }
    
    
    // MARK: - PRIVATE INSTANCE METHODS
    private func callDownloadNYCScores() {
        //if (self.arrScores.count == 0) {
        //arrNYCScoreViewModel = []
        self.apiScoreService?.downloadNYCScoreData({ (arrDictScores) in
            
            self.arrScores = arrDictScores
            self.constructViewModel { (arrVM) in
                if let arrVM = arrVM {
                    self.arrNYCScoreViewModel = arrVM
                    self.nycVC?.arrNYCScoresViewModels = self.arrNYCScoreViewModel
                    //self.nycVC?.intVal = 1
                }
            }
        })
    }
    
    
    private func constructViewModel(_ completion: @escaping (([NYCSatScoreViewModel]?) -> ())){
        if let strSelectedSchool = selectedSchool {
            arrScores.forEach({ (each) in
                if (each.strSchoolName.lowercased() == strSelectedSchool.lowercased()) {
                    print("This: \(each.strSchoolName)")
                    self.strMathScore = each.strMathScore
                    self.strWriteScore = each.strWriteScore
                    self.strSatTakersCount = each.strSatTakersCount
                    self.strSchoolName = each.strSchoolName
                    self.strReadScore = each.strReadScore
                    arrNYCScoreViewModel.append(self)
                    completion(arrNYCScoreViewModel)
                }
            })
        }
    }
}
