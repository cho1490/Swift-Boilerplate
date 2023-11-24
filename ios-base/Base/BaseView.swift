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
        initProperties()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initProperties()
        initConstraints()
    }
    
}

protocol BaseViewProtocol {
    func initProperties()
    func initConstraints()
}

extension BaseView: BaseViewProtocol {
    @objc func initProperties() { }
    @objc func initConstraints() { }
}
