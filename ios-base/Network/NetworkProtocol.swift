//
//  NetworkProtocol.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//
 
protocol NetworkProtocol {
    
    func GET<T: Decodable>(headerType: HeaderType,
                           urlType: UrlType,
                           parameters: [String: String],
                           returnType: T.Type) async throws -> Result<T, Error>
    
    func POST<T: Decodable>(headerType: HeaderType,
                            urlType: UrlType,
                            parameters: [String: Any],
                            returnType: T.Type) async throws -> Result<T, Error>
    
    func PUT<T: Decodable>(headerType: HeaderType,
                           urlType: UrlType,                           
                           parameters: [String: Any],
                           returnType: T.Type) async throws -> Result<T, Error>
    
    func DELETE<T: Decodable>(headerType: HeaderType,
                           urlType: UrlType,
                           parameters: [String: Any],
                           returnType: T.Type) async throws -> Result<T, Error>
    
}
