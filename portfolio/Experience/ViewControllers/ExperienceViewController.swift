//
//  ExperienceViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-09.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import Foundation
import UIKit

class ExperienceViewController: UITableViewController {
    
    private var model: ExperienceModel!
    
    private var numberOfExperiences: Int {
        return model.stackableItems.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = ExperienceModel()
        
        title = StringStore.experienceTitle.rawValue
        
        fetchData()
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfExperiences
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return doesIndexExist(forIndexRow: indexPath.row) ? 150 : 75
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if doesIndexExist(forIndexRow: indexPath.row) {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
            
            switch model.stackableItems[indexPath.row] {
            case .jobExperience(let company, let role, let dates, _):
                defaultCell.companyImage.image = UIImage(named: company ?? "")
                defaultCell.jobTitle.text = role
                defaultCell.dates.text = dates
                defaultCell.selectionStyle = .none
            }
            
            return defaultCell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if doesIndexExist(forIndexRow: indexPath.row) {
            presentExperienceDetailsView(row: indexPath.row)
        }
    }
}

// MARK: - Network Request via Model
extension ExperienceViewController {
    
    func fetchData(_ complete: (() -> Void)? = nil) {
        model.fetchData(completion: { [unowned self] status in
            switch status {
            case .success:
                DispatchQueue.main.async {
                    self.configureStackView()
                }
            default:
                break
            }
        })
    }
}

// MARK: - Privates
extension ExperienceViewController {
    
    private func configureStackView() {
        tableView.reloadData()
    }
    
    private func doesIndexExist(forIndexRow row: Int) -> Bool {
        return model.stackableItems.indices.contains(row)
    }
    
    private func presentExperienceDetailsView(row: Int) {
        let storyboard = UIStoryboard(name: "ExperienceDetails", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ExperienceDetails") as? ExperienceDetailsViewController else { return }
        switch model.stackableItems[row] {
        case .jobExperience(let company, let role, let dates, let description):
            vc.experienceDetails = ExperienceDetails(image: UIImage(named: company ?? ""), title: role, dates: dates, description: description)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getParentCellIndex(expansionIndex: Int) -> Int{
        var flag: Bool = true
        var selectedCellIndex = expansionIndex
        
        while (flag && selectedCellIndex >= 0) {
            selectedCellIndex -= 1
            flag = doesIndexExist(forIndexRow: selectedCellIndex)
        }
        
        return selectedCellIndex
    }
}
