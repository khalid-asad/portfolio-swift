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

    var jobData: [JobData?]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobData = getData()
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func getData() -> [JobData?] {
        let data: [JobData?] = []
        
        let rogersDesc = [JobDescData(jobDesc: "\n\nRotation 1: Production Support (June 2017 - October 2017)"), JobDescData(jobDesc: "• Automated the strenuous verification and hourly updating of IT application statuses for 5 systems effectively during the critical days period saving 10,000 hours of overtime for 3 teams"), JobDescData(jobDesc: "• Developed an automated provisioning tool for an IT application that improved efficiency by 98%"), JobDescData(jobDesc: "• Intuitively designed a PowerShell script to retrieve employee fields via Employee IDs bypassing LDAP restrictions"), JobDescData(jobDesc: "\nRotation 2: Business Systems Analyst (October 2017 - February 2018)"), JobDescData(jobDesc: "• Built a DDD, running PCR, use cases and SDS draft in a project that generated $0.5 million monthly"), JobDescData(jobDesc: "• Automated Actuals vs. Forecasting costs for a massive mandatory project saving 8 hours a week"), JobDescData(jobDesc: "\n\nRotation 3: IT Security (February 2018 - March 2018)"), JobDescData(jobDesc: "• Extensively researched Governance, Risk, and Compliance and participated in the first stage of Vendor Selection Process"), JobDescData(jobDesc: "\n\nRotation 4: Web Developer (March 2018 - June 2018)"), JobDescData(jobDesc: "• Increased the performance by 10% of a handful of broadcast websites running on WordPress by performing upgrades, introducing new plugins, and optimizing PHP and CSS code")]
        let rogers = JobData(companyImage: "rogers", jobTitle: "IT New Grad", dates: "Jun 2017 - Present", jobDescription: rogersDesc)
        
        let n8idDesc = [JobDescData(jobDesc: "• Tackled complex IAM scenarios by developing Logical Attribute Handlers (LAH) and Business Logic Task Handlers (BLTH) in Java"), JobDescData(jobDesc: "• Implemented IIS websites attaching Identity and Access Management (IAM) solutions such as CA Single Sign-On"), JobDescData(jobDesc: "• Analyzed and created XML, SOAP, HTML scripts as well as LDAP and SQL queries"), JobDescData(jobDesc: "• Promptly resolved hundreds of Network and Security incidents, actively assisting Production Support daily"), JobDescData(jobDesc: "• Created and maintained Incidents and Change Requests (CRQ) for all environments"), JobDescData(jobDesc: "• Generated VM servers (Windows Server 2012) linking them via AD, SQL, DNS and DHCP to administer CA softwares"), JobDescData(jobDesc: "• Enforced domain security to and from external companys by testing IP configuration and firewall connectivity"), JobDescData(jobDesc: "\n\nProject: AD Harmonization (April 2017 - May 2017)"), JobDescData(jobDesc: "• Flawlessly implemented and documented changes to CA Technology Suite files, data, and software to allow the ability to migrate accounts to and from two merged companies"), JobDescData(jobDesc: "• Meticulously performed FUT and UAT for SIT, QA, and Production environment changes"), JobDescData(jobDesc: "• Efficiently bulk loaded thousands of accounts while adding and maintaining access, authorization, and authentication to applications and websites")]
        let n8id = JobData(companyImage: "n8idnew", jobTitle: "Solutions Engineer", dates: "Nov 2016 - May 2017", jobDescription: n8idDesc)
        
        let fordDesc = [JobDescData(jobDesc: "• Extensively tested internal websites by creating automation scripts and test cases in HP UFT (formerly HP QTP)"), JobDescData(jobDesc: "• Identified, analyzed, documented, and resolved hundreds of defects saving millions of dollars"), JobDescData(jobDesc: "• Counselled coworkers with automation help; providing them with viable solutions to their problems"), JobDescData(jobDesc: "• Effectively trained an intern to test, develop and document MS Access Applications and Scripts"), JobDescData(jobDesc: "• Augmented efficiency through daily scrums following the Agile Software Development method"), JobDescData(jobDesc: "\n\nRelevant Project: Incentives Database"), JobDescData(jobDesc: "• Developed a MS Access application for five managers that retrieved and manipulated incentive records from java-based web applications in a user-friendly GUI effectively reducing manager workload from days to minutes"), JobDescData(jobDesc: "• Optimized VB/.NET functions and SQL statements to efficiently retrieve, store, and delete data")]
        let ford = JobData(companyImage: "ford", jobTitle: "QA Analyst Intern", dates: "Jun 2014 - Aug 2015", jobDescription: fordDesc)
        
        return [rogers, n8id, ford]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        var selectedCellIndex = expansionIndex
        
        while(selectedCell == nil && selectedCellIndex >= 0){
            selectedCellIndex -= 1
            selectedCell = jobData?[selectedCellIndex]
        }
        
        return selectedCellIndex
    }
}
