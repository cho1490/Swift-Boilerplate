//
//  DebugUtil.swift
//  ios-base
//
//  Created by 조상현 on 11/28/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

class DebugUtil {
    
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        Swift.print(items, separator: separator, terminator: terminator)
        #endif
    }
    
    static func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        Swift.debugPrint(items, separator: separator, terminator: terminator)
        #endif
    }
    
}
