//
//  TestNetworkService.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import Foundation

final class TestNetworkService: NetworkProtocol {
    
    private let jsonString: String
    
    init(jsonString: String) {
        self.jsonString = jsonString
    }
    
    func GET<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : String], returnType: T.Type) async throws -> Result<T, Error> {
        return try await result()
    }
    
    func POST<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : Any], returnType: T.Type) async throws -> Result<T, Error> {
        return try await result()
    }
    
    func PUT<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : Any], returnType: T.Type) async throws -> Result<T, Error> {
        return try await result()
    }
    
    func DELETE<T: Decodable>(headerType: HeaderType, urlType: UrlType, parameters: [String : Any], returnType: T.Type) async throws -> Result<T, Error> {
        return try await result()
    }

    private func result<T: Decodable>() async throws -> Result<T, Error> {
        let data = jsonString.data(using: .utf8)!
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(NetworkError.decodingFailed)
        }
        
        return .success(result)
    }
     
}
