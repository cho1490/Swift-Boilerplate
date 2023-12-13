//
//  BaseView.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        initConstraints()
        initProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension BaseView: BaseUIProtocol {
    @objc func initConstraints() { }
    @objc func initProperties() { }
}
