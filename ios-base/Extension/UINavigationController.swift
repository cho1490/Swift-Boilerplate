//
//  UINavigationController.swift
//  ios-base
//
//  Created by 조상현 on 11/30/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
