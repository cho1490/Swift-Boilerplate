//
//  Navigator.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import UIKit

protocol Navigatable {
    var navigator: Navigator! { get set }
}

final class Navigator {
    static let `default` = Navigator()
      
    enum Scene {
        case splash
        case main
    }
    
    func get(segue: Scene) -> UIViewController? {
        let networkService = NetworkService()
        
        switch segue {
        case .splash:
            let splashViewModel = SplashViewModel()
            return SplashViewController(viewModel: splashViewModel, navigator: self)
        case .main:
            let mainViewModel = MainViewModel(service: networkService)
            return MainViewController(viewModel: mainViewModel, navigator: self)
        }
    } 
    
    enum Transition {
        case root
        case present
        case navigate
        case push
    }
        
    func show(segue: Scene, sender: UIViewController?, transition: Transition) {
        if let target = get(segue: segue) {
            show(target: target, sender: sender, transition: transition)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case .root:
            guard let window = Application.shared.window else {
                return
            }
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                window.rootViewController = target
                window.makeKeyAndVisible()
            }, completion: nil)
            return
        default: break
        }
        
        guard let sender = sender else {
            fatalError("You need to pass in a sender for .navigation or .modal transitions")
        }
        
        switch transition {
        case .present:
            target.modalPresentationStyle = .fullScreen
            sender.present(target, animated: true)
        case .navigate:
            let target = UINavigationController(rootViewController: target)
            target.modalPresentationStyle = .fullScreen
            sender.present(target, animated: true)
        case .push:
            if let nav = sender.navigationController {
                nav.pushViewController(target, animated: true)
            } else {
                fatalError("UINavigationController does not exist")
            }
        default: break
        }
    }
    
    func pop(sender: UIViewController?, toRoot: Bool = false) {
        guard let sender = sender?.navigationController else {
            fatalError("UINavigationController does not exist")
        }
      
        if toRoot {
            sender.popToRootViewController(animated: true)
        } else {
            sender.popViewController(animated: true)
        }
    }

    func dismiss(sender: UIViewController?) {
        guard let sender = sender else {
            fatalError("UIViewController does not exist")            
        }
        
        sender.dismiss(animated: true)
    }
    
}
