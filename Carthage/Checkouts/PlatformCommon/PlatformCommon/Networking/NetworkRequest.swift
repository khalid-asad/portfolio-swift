//
//  NetworkRequest.swift
//  PlatformCommon
//
//  Created by Khalid Asad on 2019-06-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation
import UIKit

public enum FetchInfoState {
    case fetching
    case success
    case failure
}

public final class NetworkRequest {
    
    public static func fetchData<T>(_ type: T.Type, for url: URL?, completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        guard let url = url else {
            completionHandler(nil, nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            print("Data: ")
            print(data)
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(T.self, from: data)
                dump(responseData)
                print(responseData)
                completionHandler(responseData, nil)
            } catch let err {
                print("Err", err)
                completionHandler(nil, error)
            }
            }.resume()
    }
    
    public static func downloadImage(inputURL: URL?, completion: @escaping(Bool, UIImage?) -> Void) {
        guard let url = inputURL else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data = data, let image = UIImage(data: data) else {
                completion (false, nil)
                return
            }
            completion(true, image)
        }
        task.resume()
    }
}
