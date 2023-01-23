//
//  RequestManager.swift
//  Business
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation

/// A class to make requests and retrieve the expected object (or a list of it) in JSON format
public final class RequestManager: RequestManagerProtocol {

    private init() {}
    /// Singleton
    public static let shared: RequestManager = .init()

    /// Handles the first request (every request made to the API has to be made after this one)
    /// - Returns: the request to be used with URLSession
    private func makePostRequest() -> URLRequest {
        guard let url: URL = .init(string: K.Urls.fullPostRequest) else { fatalError("Unable to build URL from string.") }
        var request: URLRequest = .init(url: url)
        request.httpMethod = "post"
        return request
    }

    /// Gets expected object in JSON format from data
    /// - Parameters:
    ///   - expectedType: the type of object to be received
    ///   - url: the URL used in the request
    ///   - completion: a handler to manage what is going to happen depending on the response
    public func fetchListDataFromSPTrans<T: Decodable>(expectedType: T.Type,
                                                       url: String,
                                                       completion: @escaping (Result<T, CustomError>) -> Void) {
        guard let url: URL = .init(string: url) else {
            completion(.failure(.didNotBuildURL))
            return
        }
        let request: URLRequest = makePostRequest()
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error: Error = error {
                completion(.failure(.didReceiveErrorFromAPI(error: error)))
                return
            }
            let request2: URLRequest = .init(url: url)
            URLSession.shared.dataTask(with: request2) { data, urlResponse, error in
                if let error: Error = error {
                    completion(.failure(.didReceiveErrorFromAPI(error: error)))
                    return
                }
                guard let data: Data else {
                    completion(.failure(.didNotReceiveData))
                    return
                }
                if let t: T = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(t))
                    return
                }
                completion(.failure(.didNotDecodeJSONFromData))
            }.resume()
        }.resume()
    }

    /// Gets expected list of objects in JSON format from data
    /// - Parameters:
    ///   - expectedType: the type of objects to be received in a list
    ///   - url: the URL used in the request
    ///   - completion: a handler to manage what is going to happen depending on the response
    public func fetchListDataFromSPTransForArray<T: Decodable>(expectedType: T.Type,
                                                               url: String,
                                                               completion: @escaping (Result<[T], CustomError>) -> Void) {
        guard let url: URL = .init(string: url) else {
            completion(.failure(.didNotBuildURL))
            return
        }
        let request: URLRequest = makePostRequest()
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error: Error = error {
                completion(.failure(.didReceiveErrorFromAPI(error: error)))
                return
            }
            let request2: URLRequest = .init(url: url)
            URLSession.shared.dataTask(with: request2) { data, urlResponse, error in
                if let error: Error = error {
                    completion(.failure(.didReceiveErrorFromAPI(error: error)))
                    return
                }
                guard let data: Data else {
                    completion(.failure(.didNotReceiveData))
                    return
                }
                if let t: [T] = try? JSONDecoder().decode([T].self, from: data) {
                    completion(.success(t))
                    return
                }
                completion(.failure(.didNotDecodeJSONFromData))
            }.resume()
        }.resume()
    }

}
