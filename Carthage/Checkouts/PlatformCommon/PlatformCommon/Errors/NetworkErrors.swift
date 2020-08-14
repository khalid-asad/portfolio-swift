//
//  NetworkErrors.swift
//  PlatformCommon
//
//  Created by Khalid Asad on 7/4/20.
//  Copyright © 2020 Khalid Asad. All rights reserved.
//

/// Various networking errors encountered.
public enum NetworkError: CustomError, Equatable {
    case emptyResponse
    case invalidAPIKey
    case invalidJSONResponse
    case invalidURL
    case noData
    case noReference
    case notFound
    case other(String, Int)
    case unableToDecodeJSON
    case unauthorized
    
    public var message: String {
        switch self {
        case .emptyResponse:
            return "The response is nil or empty."
        case .invalidAPIKey:
            return "Invalid API key: You must be granted a valid key."
        case .invalidJSONResponse:
            return "The JSON Response was invalid."
        case .invalidURL:
            return "Invalid URL."
        case .noData:
            return "The request returned no data."
        case .noReference:
            return "There is no reference to the resource due to thread mismanagement"
        case .notFound:
            return "The resource you requested could not be found."
        case .other(let statusMessage, let statusCode):
            return "Status Code: \(statusCode), Status Message: \(statusMessage)"
        case .unableToDecodeJSON:
            return "Unable to decode the JSON response."
        case .unauthorized:
            return "This user is not authorized."
        }
    }
    
    /// The status code of the TMDb API.
    public var statusCode: Int? {
        switch self {
        case .invalidAPIKey: return 7
        case .notFound: return 34
        default: return nil
        }
    }
}
