//
//  JobData.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-09.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import Foundation

public class JobData {
    
    public var companyName: String
    public var jobTitle: String
    public var jobDescription: [JobDescData]?
    
    init(companyName: String, jobTitle: String, jobDescription: [JobDescData]?){
        self.companyName = companyName
        self.jobTitle = jobTitle
        self.jobDescription = jobDescription
    }

}

public class JobDescData{
    public var jobDesc: String
    
    init(jobDesc: String){
        self.jobDesc = jobDesc
    }
}
