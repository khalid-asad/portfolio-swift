//
//  JobExperienceResponse.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-10.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation

// MARK: - JobExperienceResponse
struct JobExperienceResponse: Decodable {

    var company: String?
    var role: String?
    var dates: String?
    var description: String?
}
