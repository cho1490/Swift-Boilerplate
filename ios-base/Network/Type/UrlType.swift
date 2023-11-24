//
//  UrlType.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

enum UrlType {
    
    case none
    case test

    func value() -> String {
        switch self {
        case .none:
            return ""
        case .test:
            return ConstValue.baseUrl
        }
    }
    
}
