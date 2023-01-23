//
//  CustomError.swift
//  Business
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

/// Custom error to deal with the requests from the RequestManager class
public enum CustomError: Error {
    case didNotBuildURL
    case didReceiveErrorFromAPI(error: Error)
    case didNotReceiveData
    case didNotDecodeJSONFromData

    var localizedDescription: String {
        switch self {
        case .didNotBuildURL:
            return "Unable to build URL."
        case .didReceiveErrorFromAPI(let error):
            return "Error from API: \(error.localizedDescription)"
        case .didNotReceiveData:
            return "Unable to receive data from API."
        case .didNotDecodeJSONFromData:
            return "Unable to decode JSON from API data."
        }
    }
}
