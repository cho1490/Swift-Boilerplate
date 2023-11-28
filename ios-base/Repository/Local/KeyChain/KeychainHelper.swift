//
//  KeychainHelper.swift
//  ios-base
//
//  Created by 조상현 on 11/27/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import Security
import Foundation

class KeychainHelper {
    
    static let shared = KeychainHelper()
    
    private let serviceId = Bundle.main.bundleIdentifier
    
    func create<T: Codable>(_ data: T, account: String) throws {
        let serviceId = try checkServiceId()
        
        let data = try JSONEncoder().encode(data)
        
        let query = [
            kSecValueData: data,
            kSecAttrService: serviceId,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary
         
        let status = SecItemAdd(query, nil)
        
        let result = KeychainResult(keychainError: status)
        if let error = result.error {
            if error == .DuplicateItem {
                try update(data, account: account)
            } else {
                throw error
            }
        }
    }
    
    func read<T: Codable>(account: String) throws -> T? {
        let serviceId = try checkServiceId()
        
        let query = [
            kSecReturnData: true,
            kSecAttrService: serviceId,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        guard let data = (result as? Data) else {
            throw KeyChainHelperError.DataConvertFailed
        }
        
        let item = try JSONDecoder().decode(T.self, from: data)
        return item
    }
     
    func update<T: Codable>(_ data: T, account: String) throws {
        let serviceId = try checkServiceId()
         
        let data = try JSONEncoder().encode(data)
        let query = [
            kSecAttrService: serviceId,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary

        let attributesToUpdate = [kSecValueData: data] as CFDictionary
 
        let status = SecItemUpdate(query, attributesToUpdate)
        
        let result = KeychainResult(keychainError: status)
        if let error = result.error {
            throw error
        }
    }
    
    func delete(account: String) throws {
        let serviceId = try checkServiceId()
                                
        let query = [
            kSecAttrService: serviceId,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary
                
        let status = SecItemDelete(query)

        let result = KeychainResult(keychainError: status)
        if let error = result.error {
            throw error
        }
    }
    
    private func checkServiceId() throws -> String {
        guard let serviceId = serviceId else {
            throw KeyChainHelperError.BundleIdDoesNotExist
        }
        
        return serviceId
    }
    
}

struct KeychainResult {
    let keychainError: OSStatus
    
    var isSuccess: Bool {
        return keychainError == errSecSuccess
    }
     
    var error: KeychainError? {
        guard !isSuccess else { return nil }
        return KeychainError(error: keychainError)
    }
}
