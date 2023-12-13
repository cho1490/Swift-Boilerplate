//
//  BaseTabBarController.swift
//  ios-base
//
//  Created by 조상현 on 11/24/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit
import RxSwift
 
class BaseTabBarController: UITabBarController {
    
    let safeArea = UIView()

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .label.withAlphaComponent(0.3)
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.label.withAlphaComponent(0.2).cgColor
        
        initConstraints()
        initProperties()
    }
     
}

extension BaseTabBarController: BaseUIProtocol {
    @objc func initConstraints() { }
    @objc func initProperties() { }
}
