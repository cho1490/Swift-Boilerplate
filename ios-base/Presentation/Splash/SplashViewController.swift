//
//  SplashViewController.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import RxSwift
import RxViewController

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initConstraints() {
    }

    override func initProperties() {
        view.backgroundColor = .red
    }

    override func binding() {
        guard let viewModel = viewModel as? SplashViewModel else {
            return
        }

        let input = SplashViewModel.Input(loadRequriedData: rx.viewDidAppear.map { _ in () })
        let output = viewModel.transform(input: input)

        output.loadedRequiredData
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                guard let self = self else {
                    return
                }
                self.navigator.show(segue: .main, sender: self, transition: .root)
            }).disposed(by: disposeBag)
    }

}
