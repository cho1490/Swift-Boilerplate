//
//  Application.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

final class Application {
    
    static let shared = Application()
    
    var window: UIWindow?
    
    let navigator: Navigator = Navigator.default
    
    func initScene(in window: UIWindow) {
        self.window = window
        navigator.show(segue: .splash, sender: nil, transition: .root)
    }
    
}
