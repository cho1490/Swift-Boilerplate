//
//  UIColor.swift
//  ios-base
//
//  Created by 조상현 on 11/24/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//
 
import UIKit

extension UIColor {
    convenience init(r: Int = 0, g: Int = 0, b: Int = 0, a: CGFloat = 1) {
        precondition(0...255 ~= r   &&
                     0...255 ~= g &&
                     0...255 ~= b  &&
                     0...255 ~= a, "input range is out of range 0...255")
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }
}
