//
//  SkillsModel.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-15.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit
import PlatformCommon

final class SkillsModel {
    
    // MARK: - ItemStackable
    enum StackableItem {
        case skill(skill: String?, yearsOfExperience: Int?)
    }
    
    var stackableItems: [SkillsModel.StackableItem] = []
}

// MARK: - Network Requests
extension SkillsModel {
    
    func fetchData(completion: @escaping ((FetchInfoState) -> Void)) {
        let url = URL(string: StringStore.skillsJSONPath.rawValue)
        NetworkRequest.fetchData([SkillsResponse].self, for: url, completionHandler: { [unowned self] (data, error) in
            if let error = error {
                print("Error: ")
                print(error)
                completion(.failure)
                return
            }
            
            guard let skillsData = data else {
                print("Error getting data: result is nil")
                completion(.failure)
                return
            }
            
            skillsData.forEach { skill in
                self.stackableItems.append(.skill(skill: skill.skill, yearsOfExperience: skill.yearsOfExperience))
            }
            
            completion(.success)
        })
    }
}
