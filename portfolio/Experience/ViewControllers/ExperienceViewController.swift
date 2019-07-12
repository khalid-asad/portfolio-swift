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
        
        fetchData()
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        } else {
            if doesIndexExist(forIndexRow: getParentCellIndex(expansionIndex: indexPath.row)) {
                let expansionCell = tableView.dequeueReusableCell(withIdentifier: "ExpansionCell", for: indexPath) as! ExpansionCell
                let descriptionIndex = indexPath.row - getParentCellIndex(expansionIndex: indexPath.row) - 1
                switch model.stackableItems[descriptionIndex] {
                case .jobExperience(_, _, _, let description):
                    expansionCell.jobDescription.text = description
                }
                expansionCell.selectionStyle = .none
                return expansionCell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if doesIndexExist(forIndexRow: indexPath.row) {
            if (indexPath.row + 1 >= numberOfExperiences) {
                expandCell(tableView: tableView, index: indexPath.row)
            } else {
                if doesIndexExist(forIndexRow: indexPath.row + 1) {
                    expandCell(tableView: tableView, index: indexPath.row)
                } else {
                    contractCell(tableView: tableView, index: indexPath.row)
                }
            }
        }
    }
    
    private func expandCell(tableView: UITableView, index: Int) {
        //        tableView.insertRows(at: [NSIndexPath(row: index + 1, section: 0) as IndexPath], with: .top)
        //        if let jobDescs = jobData?[index]?.jobDescription {
        //            for i in 1...jobDescs.count {
        //                jobData?.insert(nil, at: index + i)
        //                tableView.insertRows(at: [NSIndexPath(row: index + i, section: 0) as IndexPath], with: .top)
        //            }
        //        }
    }
    
    private func contractCell(tableView: UITableView, index: Int) {
        //        if let jobDescs = jobData?[index]?.jobDescription {
        //            for _ in 1...jobDescs.count {
        //                jobData?.remove(at: index+1)
        //                tableView.deleteRows(at: [NSIndexPath(row: index + 1, section: 0) as IndexPath], with: .top)
        //            }
        //        }
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
}
