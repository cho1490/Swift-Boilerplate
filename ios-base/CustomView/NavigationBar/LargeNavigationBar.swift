//
//  LargeNavigationBar.swift
//  ios-base
//
//  Created by 조상현 on 11/30/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//
 
import UIKit

class LargeNavigationBar: BaseNavigationBar {

    override func initProperties() {
        contentHeight = 62
        titleLabel.font = Theme.Font.NavigationHeader
    }

    override func initConstraints() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Theme.Padding.Medium)
            $0.centerY.equalToSuperview()

        }

        addSubview(rightButtonStackView)
        rightButtonStackView.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
        }
    }
    
}
