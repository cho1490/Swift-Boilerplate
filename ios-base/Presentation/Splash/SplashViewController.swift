//
//  SplashViewController.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import RxSwift
import RxViewController
import RxCocoa

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initConstraints() {
    }

    override func initProperties() {
        view.backgroundColor = Theme.Color.base
    }

    override func binding() {
        guard let viewModel = viewModel as? SplashViewModel else {
            return
        }
            
        let input = SplashViewModel.Input(viewDidAppearTrigger: rx.viewDidAppear.asDriver().map { _ in () })
        let output = viewModel.transform(input: input)
        output.pushViewController.drive(onNext: { [weak self] in
            guard let self = self else {
                return
            }

            DispatchQueue.main.async {
                self.navigator.show(segue: .main, sender: self, transition: .root)
            }
        }).disposed(by: disposeBag)
    }

}
