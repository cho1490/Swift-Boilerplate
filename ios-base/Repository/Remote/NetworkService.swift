//
//  NetworkService.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import Foundation

final class NetworkService: NetworkProtocol {

    // MARK: - GET
    func GET<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : String], returnType: T.Type) async throws -> Result<T, Error> {
        var queryString = ""
        if !parameters.isEmpty {
            queryString += "?"
            for parameter in parameters {
                queryString += "\(parameter.key)=\(parameter.value)&"
                
                if queryString.last == "&" {
                    queryString.removeLast()
                }
            }
        }
        
        let urlString = "\(urlType.value())\(queryString)"
        guard let urlRequest = makeUrlRequest(from: urlString, requestType: "GET") else {
            return .failure(NetworkError.InvalidUrl)
        }
        
        return try await dataTask(with: urlRequest)
    }
    
    // MARK: - POST
    func POST<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : Any], returnType: T.Type) async throws -> Result<T, Error> {
        let urlString = "\(urlType.value())"
        guard var urlRequest = makeUrlRequest(from: urlString, requestType: "POST") else {
            return .failure(NetworkError.InvalidUrl)
        }
        urlRequest.httpBody = parameters.percentEncoded()
        
        return try await dataTask(with: urlRequest)
    }
     
    // MARK: - PUT
    func PUT<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : Any], returnType: T.Type) async throws -> Result<T, Error> {
        let urlString = "\(urlType.value())"
        guard var urlRequest = makeUrlRequest(from: urlString, requestType: "PUT") else {
            return .failure(NetworkError.InvalidUrl)
        }
        urlRequest.httpBody = parameters.percentEncoded()
        
        return try await dataTask(with: urlRequest)
    }
    
    // MARK: - DELETE
    func DELETE<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : Any], returnType: T.Type) async throws -> Result<T, Error> {
        let urlString = "\(urlType.value())"
        guard var urlRequest = makeUrlRequest(from: urlString, requestType: "PUT") else {
            return .failure(NetworkError.InvalidUrl)
        }
        urlRequest.httpBody = parameters.percentEncoded()
        
        return try await dataTask(with: urlRequest)
    }
    
    // MARK: - Util
    private func makeUrlRequest(from urlString: String, requestType: String) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType
        return urlRequest
    }
    
    private func dataTask<T: Decodable>(with urlRequest: URLRequest) async throws -> Result<T, Error> {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
            return .failure(NetworkError.StatusCodeError)
        }
        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(NetworkError.DecodingError)
        }
        
        return .success(result)
    }
    
}

extension Dictionary {
    func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
