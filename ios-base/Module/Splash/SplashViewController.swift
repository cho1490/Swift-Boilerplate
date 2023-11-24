//
//  SplashViewController.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import RxSwift
import RxCocoa

class SplashViewController: BaseViewController {
    
    let logo = UILabel().then {
        $0.text = "💸"
        $0.font = .systemFont(ofSize: 68)
    }
    
    let readyToLaunch = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initConstraints() {
        useSafeAreaView()
        
        safeArea.addSubview(logo)
        logo.snp.makeConstraints {
            $0.center.equalTo(safeArea)
        }
    }
    
    override func binding() {
        guard let viewModel = viewModel as? SplashViewModel else {
            return
        }
            
        let input = SplashViewModel.Input(readyToLaunch: readyToLaunch)
        let output = viewModel.transform(input: input)
        
        output.pushNextViewController.subscribe(onNext: { [weak self] in
            guard let self = self else {
                return
            }
                        
            DispatchQueue.main.async {
                self.navigator.show(segue: .main, sender: self, transition: .root)
            }
        }).disposed(by: self.disposeBag)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                     
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else {
                return
            }
            
            readyToLaunch.onNext(())
        }
    }
    
}
