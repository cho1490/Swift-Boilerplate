//
//  ScreenUtil.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

class ScreenUtil {
            
    static var safeAreaSize: UIEdgeInsets {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

        return window.safeAreaInsets
    }

    static var displaySize: CGSize {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return CGSize(width: 0, height: 0)
        }

        return window.frame.size
    }

    static var rootViewController: UIViewController? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return nil
        }

        return window.rootViewController
    }

    static func showAlert(in viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }

    static func showToast(in viewController: UIViewController, _ message: String, during: TimeInterval = 1.5) {
        let toast = Toast()
        viewController.view.addSubview(toast)
        toast.snp.makeConstraints {
            $0.centerX.equalTo(viewController.view.snp.centerX)
            $0.bottom.equalTo(viewController.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        toast.show(message: message, during: during)
    }

}
