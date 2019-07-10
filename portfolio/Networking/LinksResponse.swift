//
//  Links.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-10.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation

// MARK: - LinksResponse
struct LinksResponse: Codable {
    let github, linkedin, website: String
    let email: String
    let googlePlay, changelog, feedback, star: String
    let donate: String
    let help: String
    
    enum CodingKeys: String, CodingKey {
        case github, linkedin, website, email
        case googlePlay = "google play"
        case changelog, feedback, star, donate, help
    }
}
