//
//  UIButton.swift
//  ios-base
//
//  Created by 조상현 on 12/1/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(completion: @escaping () -> Void) {
        self.init(primaryAction: UIAction(handler: { _ in
            completion()
        }))
    }
}
