//
//  UserDefaultsHelper.swift
//  ios-base
//
//  Created by 조상현 on 11/27/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import Foundation
  
class UserDefaultsHelper {
    
    static let shared: UserDefaultsHelper = UserDefaultsHelper()
    
    private let defaults: UserDefaults = UserDefaults.standard
     
    // MARK: - useAutoLogin
    private let useAutoLoginKey: String = "useAutoLogin"
    func useAutoLogin(_ useAutoLogin: Bool) {
        defaults.setValue(useAutoLogin, forKey: useAutoLoginKey)
    }
    func useAutoLogin() -> Bool {
        defaults.bool(forKey: useAutoLoginKey)
    }
    
    // MARK: - saveUserId
    private let saveUserIdKey: String = "saveUserId"
    func saveUserId(_ saveUserId: String) {
        defaults.setValue(saveUserId, forKey: saveUserIdKey)
    }
    func saveUserId() -> String? {
        defaults.string(forKey: saveUserIdKey)
    }
    
}
