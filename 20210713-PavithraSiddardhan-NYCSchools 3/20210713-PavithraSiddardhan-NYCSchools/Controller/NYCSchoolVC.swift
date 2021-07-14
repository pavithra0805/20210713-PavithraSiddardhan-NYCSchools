//
//  ViewController.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 13/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import UIKit

// MARK: - VIEW CONTROLLER - NYCSchoolVC - show  school name, city ,filter schools based on Segment selected

class NYCSchoolVC: UIViewController {
    
    // MARK: - OUTLETS FROM STORYBOARD
    @IBOutlet weak var segmentGrades: UISegmentedControl!
    
    @IBOutlet weak var tableViewSchools: UITableView!
    
    @IBOutlet weak var lblGrade: UILabel!
    
    //PRIVATE PROPERTIES
    private var arrMaintainedToFilter = [NYCViewModel]()
    private var strSelectedSchool = String()
    
    //OTHER PROPERTIES
    var arrNYCViewModel : [NYCViewModel] = [NYCViewModel()] {
        didSet {
            DispatchQueue.main.async { //UI SHOULD UPDATE ONLY IN MAIN THREAD
                if (self.arrNYCViewModel.count > 0) {
                    self.lblGrade.isHidden = false
                    self.segmentGrades.isHidden = false
                    self.arrMaintainedToFilter = (self.arrMaintainedToFilter.count > 0) ? self.arrMaintainedToFilter : self.arrNYCViewModel
                    self.tableViewSchools.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblGrade.isHidden = true
        segmentGrades.isHidden = true
        let viewModel = NYCViewModel()
        viewModel.nycVC = self
        tableViewSchools.delegate = self
        tableViewSchools.dataSource = self
        if let arrVM = viewModel.arrNYCViewModel {
            self.arrNYCViewModel = arrVM
            filterBasedOnSegmentValue()
        }
        tableViewSchools.tableFooterView = UIView()
    }
    
    // MARK: - IBACTION - SEGMENT CONTROL CHANGED
    @IBAction func segmentControlChanged(_ sender: Any) {
        filterBasedOnSegmentValue()
    }
    
    // MARK: - IBACTION - UNWINDING BACK IF NO DATA
    @IBAction func unwindToVC(sender: UIStoryboardSegue) {
        // self.performSegue(withIdentifier: "unwindToVC", sender: self)
        print("unwind called")
    }
    
    
    // MARK: - PRIVATE INSTANCE METHODS
    private func filterBasedOnSegmentValue() {
        let viewModel = NYCViewModel()
        viewModel.nycVC = self
        if (segmentGrades.selectedSegmentIndex == 0) {
            arrNYCViewModel = arrMaintainedToFilter
        }
        else {
            if let grade = segmentGrades.titleForSegment(at: segmentGrades.selectedSegmentIndex) {
                arrNYCViewModel = arrMaintainedToFilter.filter({ (each) -> Bool in
                    each.finalGrades == grade
                })
            }
            
        }
        
    }
    
    // MARK: - SEGUE METHODS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "navigateToScores") {
            if let destinationVC = segue.destination as? NYCScoresVC {
                // strSelectedSchool = ((segmentGrades.selectedSegmentIndex == 0) ? arrMaintainedToFilter[indexPath.row].strSchool : arrNYCViewModel[indexPath.row].strSchool) ?? ""
                destinationVC.strSelectedSchool = strSelectedSchool
            }
        }
    }
    
    
}

// MARK: - EXTENION OF TYPE NYCSchoolVC,TO UITableViewDataSource,UITableViewDelegate
extension NYCSchoolVC : UITableViewDataSource, UITableViewDelegate
{
    
    // NUMBER OF ROWS IN TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNYCViewModel.count
    }
    
    //CELL SPECIFICATIONS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSchools.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let viewModel = arrNYCViewModel[indexPath.row]  //{
        cell.textLabel?.text = viewModel.strSchool
        cell.detailTextLabel?.text = viewModel.strCity
        // }
        return cell
    }
    
    //WHEN USER TAPS PARTICULAR ROW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        strSelectedSchool = ((segmentGrades.selectedSegmentIndex == 0) ? arrMaintainedToFilter[indexPath.row].strSchool : arrNYCViewModel[indexPath.row].strSchool) ?? ""
        self.performSegue(withIdentifier: "navigateToScores", sender: self)
    }
    
    
}
