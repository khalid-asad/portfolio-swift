//
//  ExperienceModel.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-10.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation

import UIKit
import PlatformCommon

final class ExperienceModel {
    
    // MARK: - ItemStackable
    enum StackableItem {
        case jobExperience(company: String?, role: String?, dates: String?, description: String?)
    }
    
    var stackableItems: [ExperienceModel.StackableItem] = []
}

// MARK: - Network Requests
extension ExperienceModel {
    
    func fetchData(completion: @escaping ((FetchInfoState) -> Void)) {
        let url = URL(string: StringStore.jobExperienceJSONPath.rawValue)
        NetworkRequest.fetchData([JobExperienceResponse].self, for: url, completionHandler: { [unowned self] (data, error) in
            if let error = error {
                print("Error: ")
                print(error)
                completion(.failure)
                return
            }
            
            guard let jobData = data else {
                print("Error getting data: result is nil")
                completion(.failure)
                return
            }
            
            jobData.forEach { experience in
                self.stackableItems.append(.jobExperience(company: experience.company, role: experience.role, dates: experience.dates, description: experience.description))
            }
            
            completion(.success)
        })
    }
}
