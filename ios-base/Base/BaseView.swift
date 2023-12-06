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
        initConstraints()
        initProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initConstraints()
        initProperties()
    }
    
}

protocol BaseViewProtocol {
    func initConstraints()
    func initProperties()
}

extension BaseView: BaseViewProtocol {
    @objc func initConstraints() { }
    @objc func initProperties() { }
}
