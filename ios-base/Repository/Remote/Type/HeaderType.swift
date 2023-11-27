//
//  HeaderType.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

enum HeaderType {
    
    case none
    case test
    
    func value() -> [String: String] {
        switch self {
        case .none:
            return [:]
        case .test:
            return ["Content-Type": "application/json"]
        }
    }
    
}
