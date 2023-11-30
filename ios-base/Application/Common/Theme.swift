//
//  Theme.swift
//  ios-base
//
//  Created by 조상현 on 11/24/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

struct Theme {

    struct Color {
        static let base = UIColor(r: 138, g: 197, b: 176, a: 1)
    }

    struct Padding {
        static let Large: CGFloat = 24
        static let MediumLarge: CGFloat = 20
        static let Medium: CGFloat = 16
        static let MediumSmall: CGFloat = 12
        static let Small: CGFloat = 8
    }

    struct Spacing {
        static let Large: CGFloat = 20
        static let Medium: CGFloat = 16
        static let Small: CGFloat = 12
    }

    struct Radius {
        static let Large: CGFloat = 15
        static let Medium: CGFloat = 10
        static let Small: CGFloat = 5
    }

    struct Opacity {
        static let Low: Double = 0.85
        static let Standard: Double = 0.7
        static let High: Double = 0.65
    }

    struct Font {
        static let NavigationHeader: UIFont = .systemFont(ofSize: FontSize.XLarge, weight: .bold)
        static let NavigationTitle: UIFont = .systemFont(ofSize: FontSize.Medium, weight: .semibold)



        static let SectionHeader: UIFont = .systemFont(ofSize: FontSize.MediumLarge, weight: .semibold)
        static let SectionSubHeader: UIFont = .systemFont(ofSize: FontSize.MediumSmall, weight: .medium)

        static let PreviewTitle: UIFont = .systemFont(ofSize: FontSize.MediumSmall, weight: .regular)
        static let PreviewSubTitle: UIFont = .systemFont(ofSize: FontSize.XSmall, weight: .regular)
        static let PreviewBody: UIFont = .systemFont(ofSize: FontSize.Small, weight: .regular)

        static let ContentTitle: UIFont = .systemFont(ofSize: FontSize.Medium, weight: .bold)
        static let ContentSubTitle: UIFont = .systemFont(ofSize: FontSize.Medium, weight: .bold)
        static let ContentBody: UIFont = .systemFont(ofSize: FontSize.Small, weight: .regular)

        static let LargeButton: UIFont = .systemFont(ofSize: FontSize.Small, weight: .regular)
        static let MediumButton: UIFont = .systemFont(ofSize: FontSize.Small, weight: .regular)
        static let SmallButton: UIFont = .systemFont(ofSize: FontSize.Small, weight: .regular)
    }

    struct FontSize {
        static let XXLarge: CGFloat = 40
        static let XLarge: CGFloat = 34
        static let Large: CGFloat = 26
        static let MediumLarge: CGFloat = 22
        static let Medium: CGFloat = 18
        static let MediumSmall: CGFloat = 16
        static let Small: CGFloat = 14
        static let XSmall: CGFloat = 12
        static let XXSmall: CGFloat = 8
    }

}
