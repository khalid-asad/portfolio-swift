//
//  HomeModel.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-09.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit
import PlatformCommon

final class HomeModel {
    
    // MARK: - ItemStackable
    enum StackableItem {
        case link(image: UIImage?, title: String?, url: URL?)
    }
    
    var links: [String : String] = [:]
    
    var stackableItems: [HomeModel.StackableItem] {
        var items: [HomeModel.StackableItem] = []
        for (name, link) in links {
            items.append(.link(image: UIImage(named: name), title: name.uppercased(), url: URL(string: link)))
        }
        return items
    }
}

// MARK: - Network Requests
extension HomeModel {
    
    func fetchData(completion: @escaping ((FetchInfoState) -> Void)) {
        let url = URL(string: StringStore.linksJSONPath.rawValue)
        NetworkRequest.fetchData(LinksResponse.self, for: url, completionHandler: { [unowned self] (data, error) in
            if let error = error {
                print("Error: ")
                print(error)
                completion(.failure)
                return
            }
            
            guard let linksData = data else {
                print("Error getting data: result is nil")
                completion(.failure)
                return
            }
            
            self.links["github"] = linksData.github
            self.links["linkedin"] = linksData.linkedin
            self.links["website"] = linksData.website
            self.links["email"] = linksData.email
            self.links["google play"] = linksData.googlePlay
            self.links["changelog"] = linksData.changelog
            self.links["feedback"] = linksData.feedback
            self.links["star"] = linksData.star
            self.links["donate"] = linksData.donate
            self.links["help"] = linksData.help
            
            completion(.success)
        })
    }
}
