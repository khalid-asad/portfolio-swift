//
//  JobData.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-09.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import Foundation

public class JobData {
    
    public var companyImage: String
    public var jobTitle: String
    public var dates: String
    public var jobDescription: [JobDescData]?
    
    init(companyImage: String, jobTitle: String, dates: String, jobDescription: [JobDescData]?){
        self.companyImage = companyImage
        self.jobTitle = jobTitle
        self.dates = dates
        self.jobDescription = jobDescription
    }
}

public class JobDescData{
    public var jobDesc: String
    
    init(jobDesc: String){
        self.jobDesc = jobDesc
    }
}
