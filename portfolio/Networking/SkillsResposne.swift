//
//  SkillsResposne.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-15.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation

// MARK: - SkillsResponse
struct SkillsResponse: Decodable {
    
    var skill: String?
    var yearsOfExperience: Int?
    
    enum CodingKeys: String, CodingKey {
        case skill
        case yearsOfExperience = "years_of_experience"
    }
}
