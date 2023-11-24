//
//  ScreenUtil.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

class ScreenUtil {
            
    enum SafeAreaDirection {
        case top
        case bottom
    }
    
    static func getSafeAreaSize(direction: SafeAreaDirection) -> CGFloat {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        switch direction {
        case .top:
            let top = scene?.windows.first?.safeAreaInsets.top ?? .zero
            return top
        case .bottom:
            let bottom = scene?.windows.first?.safeAreaInsets.bottom ?? .zero
            return bottom
        }
    }
    
    static private func getRootViewController() -> UIViewController? {
        if let keyWindowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
             if let keyWindow = keyWindowScene.windows.first(where: { $0.isKeyWindow }) {
                 return keyWindow.rootViewController
             }
         }
        
        return nil
    }
    
    static func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in }
        alertController.addAction(okAction)
        
        if let rootVC = getRootViewController() {
            rootVC.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func showToast(_ message: String, during: TimeInterval = 1.5) {
        if let rootVC = getRootViewController() {
            let toast = Toast()
            
            rootVC.view.addSubview(toast)
            toast.snp.makeConstraints {
                $0.centerX.equalTo(rootVC.view.snp.centerX)
                $0.bottom.equalTo(rootVC.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            }
            
            toast.show(message: message, during: during)
        }
    }
    
}
