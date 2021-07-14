//
//  NYCScoresVC.swift
//  20210713-PavithraSiddardhan-NYCSchools
//
//  Created by Pavithra Siddardhan on 14/07/21.
//  Copyright © 2021 Pavithra Siddardhan. All rights reserved.
//

import UIKit

// MARK: - VIEW CONTROLLER - NYCScoresVC - show math school name, scores, test takers count, skill level

class NYCScoresVC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var txtVwSatScores: UITextView!
    
    @IBOutlet weak var lblSchoolName: UILabel!
    
    @IBOutlet weak var lblAvgMath: UILabel!
    
    @IBOutlet weak var lblAvgReading: UILabel!
    
    @IBOutlet weak var lblAvgWriting: UILabel!
    
    
    @IBOutlet weak var lblNumberOfTakers: UILabel!
    
    @IBOutlet weak var lblSkillLevel: UILabel!
    
    @IBOutlet weak var lblSkillView: UILabel!
    
    //INSTANCE PROPERTIES
    var arrNYCScoresViewModels = [NYCSatScoreViewModel](){
        didSet {
            if let scoreData = self.arrNYCScoresViewModels.first, let strSchoolName = scoreData.strSchoolName, let strMathScore = scoreData.strMathScore, let strReadScore = scoreData.strReadScore, let strWriteScore = scoreData.strWriteScore, let strSatTakersCount = scoreData.strSatTakersCount {
                DispatchQueue.main.async {//UI SHOULD UPDATE ONLY IN MAIN THREAD
                    
                    self.txtVwSatScores.text = "SCHOOL NAME: \(strSchoolName)"
                    self.lblAvgMath.text = "AVERAGE SCORE - MATHS: \(strMathScore)"
                    self.lblAvgReading.text = "AVERAGE SCORE - READING: \(strReadScore)"
                    self.lblAvgWriting.text = "AVERAGE SCORE - WRITING: \(strWriteScore)"
                    self.lblNumberOfTakers.text = "TOTAL SAT TEST TAKERS: \(strSatTakersCount)"
                    self.cofirmSkillsLevel()
                    
                }
            }
            
        }
    }
    var strSelectedSchool = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let viewModel = NYCSatScoreViewModel(selectedSchool: strSelectedSchool)
        viewModel.nycVC = self
        lblSkillView.isHidden = true
        lblSkillLevel.isHidden = true
    }
    
    // MARK: - PRIVATE INSTANCE METHODS
    
    private func cofirmSkillsLevel() {
        if (arrNYCScoresViewModels.count > 0) {
            if let arrVM = arrNYCScoresViewModels.first, let mathScore = arrVM.strMathScore,let writeScore = arrVM.strWriteScore,let readScore = arrVM.strReadScore, let nSat = arrVM.strSatTakersCount {
                if let mathScore = Int(mathScore), let readScore = Int(readScore), let writeScore = Int(writeScore),let nSatTaker = Int(nSat) {
                    let skillScore = (mathScore + readScore + writeScore) / nSatTaker
                    lblSkillView.isHidden = false
                    lblSkillLevel.isHidden = false
                    switch skillScore {
                    case 50...:
                        lblSkillLevel.text = "SKILL LEVEL:  High"
                        lblSkillView.backgroundColor = .green
                    case 25...50:
                        lblSkillLevel.text = "SKILL LEVEL:  Intermediate"
                        lblSkillView.backgroundColor = .orange
                    default:
                        lblSkillLevel.text = "SKILL LEVEL:  Low"
                        lblSkillView.backgroundColor = .red
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let _ = touches.first {
            if(arrNYCScoresViewModels.count == 0) {
                let alertController = UIAlertController(title: "No Value", message: "No Scores details Present For this school \(self.strSelectedSchool)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in (self.performSegue(withIdentifier: "unwindToVC1", sender: self))
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion:nil)
            }}
    }
}







