//
//  AViewController.swift
//  ios-base
//
//  Created by 조상현 on 11/24/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//
 
import UIKit


class AViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initConstraints() {
    }

    override func initProperties() {
    }

    override func binding() {
    }

}

#if DEBUG
import SwiftUI

struct AViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            AViewController(navigator: Navigator())
        }
        .ignoresSafeArea()
        .applyPreviewConfigs(with: "\(self)")        
    }
}
#endif
