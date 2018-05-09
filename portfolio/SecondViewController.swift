//
//  SecondViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-09.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import Foundation
import UIKit


class SecondViewController: UITableViewController {

    var jobData: [JobData?]?
    
    override func viewDidLoad() {
        jobData = getData()
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func getData() -> [JobData?] {
        let data: [JobData?] = []
        
        let rogersDesc = [JobDescData(jobDesc: "Here is the job description for rogers job."), JobDescData(jobDesc: "more job description for rogers job.")]
        let rogers = JobData(companyImage: "rogers", jobTitle: "IT New Grad", dates: "june-present", jobDescription: rogersDesc)
        
        let n8idDesc = [JobDescData(jobDesc: "Here is the job description for n8id job."), JobDescData(jobDesc: "more job description for n8id job.")]
        let n8id = JobData(companyImage: "n8identity", jobTitle: "Solutions Engineer", dates: "sep-may", jobDescription: n8idDesc)
        
        let fordDesc = [JobDescData(jobDesc: "Here is the job description for ford job."), JobDescData(jobDesc: "more job description for ford job.")]
        let ford = JobData(companyImage: "ford", jobTitle: "QA Analyst Intern", dates: "2014-2015", jobDescription: fordDesc)
        
        return [rogers, n8id, ford]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let data = jobData{
            return data.count
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let rowData = jobData?[indexPath.row]{
            return 150
        }else{
            return 75
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if let rowData = jobData?[indexPath.row]{
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
            defaultCell.companyImage.image = UIImage(named: rowData.companyImage)
            defaultCell.jobTitle.text = rowData.jobTitle
            defaultCell.dates.text = rowData.dates
            defaultCell.selectionStyle = .none
            return defaultCell
        }else{
            if let rowData = jobData?[getParentCellIndex(expansionIndex: indexPath.row)] {
                let expansionCell = tableView.dequeueReusableCell(withIdentifier: "ExpansionCell", for: indexPath) as! ExpansionCell
                let parentCellIndex = getParentCellIndex(expansionIndex: indexPath.row)
                let descriptionIndex = indexPath.row - parentCellIndex - 1
                
                expansionCell.jobDescription.text = rowData.jobDescription?[descriptionIndex].jobDesc
                expansionCell.selectionStyle = .none

                return expansionCell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = jobData?[indexPath.row] {
            if(indexPath.row + 1 >= (jobData?.count)!) {
                expandCell(tableView: tableView, index: indexPath.row)
            }else{
                if(jobData?[indexPath.row+1] != nil) {
                    expandCell(tableView: tableView, index: indexPath.row)
                }else{
                    contractCell(tableView: tableView, index: indexPath.row)
                }
            }
        }
    }
    
    private func expandCell(tableView: UITableView, index: Int){
        if let jobDescs = jobData?[index]?.jobDescription {
            for i in 1...jobDescs.count {
                jobData?.insert(nil, at: index + i)
                tableView.insertRows(at: [NSIndexPath(row: index + i, section: 0) as IndexPath], with: .top)
            }
        }
    }
    
    private func contractCell(tableView: UITableView, index: Int){
        if let jobDescs = jobData?[index]?.jobDescription {
            for i in 1...jobDescs.count {
                jobData?.remove(at: index+1)
                tableView.deleteRows(at: [NSIndexPath(row: index + 1, section: 0) as IndexPath], with: .top)
            }
        }
    }
    
    private func getParentCellIndex(expansionIndex: Int) -> Int{
        var selectedCell: JobData?
        var selectedCellIndex: expansionIndex
        
        while(selectedCell == nil && selectedCellIndex >= 0){
            selectedCellIndex -= 1
            selectedCell = jobData?[selectedCellIndex]
        }
        
        return selectedCellIndex
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
