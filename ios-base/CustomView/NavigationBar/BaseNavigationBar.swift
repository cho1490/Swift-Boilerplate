//
//  BaseNavigationBar.swift
//  ios-base
//
//  Created by 조상현 on 11/30/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

class BaseNavigationBar: BaseView {

    var contentHeight: CGFloat = 0
    
    var onSelectedButton: (NavigationItemType) -> Void = { _ in }
    
    let titleLabel: UILabel = UILabel()

    lazy var rightButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    
    func onSelectedButton(_ action: @escaping (NavigationItemType) -> Void) {
        onSelectedButton = action
    }

    func setRightButton(rightButtons: [NavigationItemType] = []) {
        appendStackView(rightButtons)
    }

    func appendStackView(_ rigthButtons: [NavigationItemType]) {
        for rigthButton in rigthButtons {
            switch (rigthButton) {
            case .plus:
                let button = makeButton(type: .plus, image: makeSystemImage(name: "plus"))
                rightButtonStackView.addArrangedSubview(button)
            default:
                break
            }
        }
    }

    func setNavigation(title: String) {
        titleLabel.text = title
    }

    func makeSystemImage(name: String) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration(pointSize: 18)
        return UIImage(systemName: name, withConfiguration: configuration)
    }

    func makeButton(type: NavigationItemType, image: UIImage?) -> UIButton {
        return UIButton(frame: .zero,
                        primaryAction: UIAction(handler: { [unowned self] _ in onSelectedButton(type) })).then {
            $0.setImage(image, for: .normal)
            $0.tintColor = .label
            $0.snp.makeConstraints {
                $0.width.height.equalTo(36)
            }
        }
    }

}

enum NavigationBarType {
    case base
    case large
}

enum NavigationItemType {
    case back
    case plus
    case ellipsis
    case select
    case delete
}
