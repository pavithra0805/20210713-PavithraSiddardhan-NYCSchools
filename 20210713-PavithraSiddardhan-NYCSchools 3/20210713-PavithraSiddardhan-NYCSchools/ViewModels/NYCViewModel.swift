//
//  NYCViewModel.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 13/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import Foundation

// MARK: - CLASS - NYCViewModel - VIEWMODEL FOR NYCSchoolVC
class NYCViewModel {
    
    // MARK: - INSTANCE PROPERTIES
    
    //private properties
    private var apiService : Service?
    private var arrSchools : [NYCSchools]? {
        didSet {
            callDownloadNYCSchools()
        }
    }
    
    //weak property to avoid cyclic reference
    weak var nycVC : NYCSchoolVC?
    
    //OTHER PROPERTIES
    var arrNYCViewModel : [NYCViewModel]?
    var strCity : String?
    var strSchool : String?
    var finalGrades : String?
    
    //INITIALIZER
    init() {
        apiService =  Service()
        if (arrSchools == nil) {
            callDownloadNYCSchools()
        }
    }
    
    
    
    // MARK: - PRIVATE INSTANCE METHODS
    
    private func callDownloadNYCSchools() {
        self.apiService?.downloadNYCData({ (arrDictSchools) in
            self.arrSchools = arrDictSchools
            self.constructViewModel { (arrVM) in
                if (arrVM!.count > 0) {
                    self.arrNYCViewModel = arrVM
                    self.nycVC?.arrNYCViewModel = self.arrNYCViewModel ?? []
                }
            }
        })
    }
    
    private func constructViewModel(_ completion: @escaping (([NYCViewModel]?) -> ())){
        arrNYCViewModel = [NYCViewModel]()
        arrSchools?.forEach({ (each) in
            let viewModel = NYCViewModel()
            viewModel.strCity = each.city
            viewModel.strSchool = each.schoolName
            viewModel.finalGrades = each.finalGrades
            arrNYCViewModel?.append(viewModel)
        })
        var grades = [String]()
        arrNYCViewModel?.forEach({ (each) in
            grades.append(each.finalGrades!)
        })
        completion(arrNYCViewModel)
    }
    
    
}
