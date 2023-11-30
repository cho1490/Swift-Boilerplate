//
//  NavigationBar.swift
//  ios-base
//
//  Created by 조상현 on 11/30/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

class NavigationBar: BaseNavigationBar {

    private lazy var backButton = makeButton(type: .back, image: makeSystemImage(name: "chevron.backward"))

    override func initProperties() {
        contentHeight = 44
        titleLabel.font = Theme.Font.NavigationTitle
    }

    override func initConstraints() {
        addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }

        addSubview(rightButtonStackView)
        rightButtonStackView.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
        }
    }

}

