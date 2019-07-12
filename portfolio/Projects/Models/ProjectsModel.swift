//
//  ProjectsModel.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-12.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit
import PlatformCommon

final class ProjectsModel {
    
    // MARK: - ItemStackable
    enum StackableItem {
        case project(project: String?, image: String?, description: String?)
    }
    
    var stackableItems: [ProjectsModel.StackableItem] = []
}

// MARK: - Network Requests
extension ProjectsModel {
    
    func fetchData(completion: @escaping ((FetchInfoState) -> Void)) {
        let url = URL(string: StringStore.projectsJSONPath.rawValue)
        NetworkRequest.fetchData([ProjectsResponse].self, for: url, completionHandler: { [unowned self] (data, error) in
            if let error = error {
                print("Error: ")
                print(error)
                completion(.failure)
                return
            }
            
            guard let projectData = data else {
                print("Error getting data: result is nil")
                completion(.failure)
                return
            }
            
            projectData.forEach { project in
                self.stackableItems.append(.project(project: project.project, image: project.image, description: project.description))
            }
            
            completion(.success)
        })
    }
}
