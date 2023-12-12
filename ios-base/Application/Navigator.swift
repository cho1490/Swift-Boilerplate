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
        switch segue {
        case .splash:
            return SplashViewController(viewModel: SplashViewModel(), navigator: self)
        case .main:
            let aViewModel = AViewModel()
            let aViewController = UINavigationController(rootViewController: AViewController(viewModel: aViewModel, navigator: self))
            aViewController.setTabBarItem(title: "a", image: UIImage(systemName: "a.circle.fill"))

            let bViewModel = BViewModel()
            let bViewController = UINavigationController(rootViewController: BViewController(viewModel: bViewModel, navigator: self))
            bViewController.setTabBarItem(title: "b", image: UIImage(systemName: "b.circle.fill"))

            let cViewModel = CViewModel()
            let cViewController = CViewController(viewModel: cViewModel, navigator: self)
            cViewController.setTabBarItem(title: "c", image: UIImage(systemName: "c.circle.fill"))

            let mainTabBarController = MainTabBarController()
            mainTabBarController.viewControllers = [aViewController, bViewController, cViewController]
            return mainTabBarController
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
