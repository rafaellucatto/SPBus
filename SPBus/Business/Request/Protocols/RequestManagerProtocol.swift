//
//  RequestManagerProtocol.swift
//  Business
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

public protocol RequestManagerProtocol {
    
    /// Gets expected object in JSON format from data
    /// - Parameters:
    ///   - expectedType: the type of object to be received
    ///   - url: the URL used in the request
    ///   - completion: a handler to manage what is going to happen depending on the response
    func fetchListDataFromSPTrans<T: Decodable>(expectedType: T.Type,
                                                url: String,
                                                completion: @escaping (Result<T, CustomError>) -> Void)
    
    /// Gets expected list of objects in JSON format from data
    /// - Parameters:
    ///   - expectedType: the type of objects to be received in a list
    ///   - url: the URL used in the request
    ///   - completion: a handler to manage what is going to happen depending on the response
    func fetchListDataFromSPTransForArray<T: Decodable>(expectedType: T.Type,
                                                        url: String,
                                                        completion: @escaping (Result<[T], CustomError>) -> Void)
}
