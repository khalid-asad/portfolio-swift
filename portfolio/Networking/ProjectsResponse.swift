//
//  ProjectsResponse.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-12.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation

// MARK: - ProjectsResponse
struct ProjectsResponse: Decodable {
    
    var project: String?
    var image: String?
    var description: String?
}
