//
//  SplashViewModel.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import RxSwift
import RxCocoa

class SplashViewModel: BaseViewModel, BaseViewModelProtocol {
    
    struct Input {
        let viewDidAppearTrigger: Driver<Void>
    }
    
    struct Output {
        let pushViewController: Driver<Void>
    }
    private let pushViewControllerSubject: BehaviorSubject<Void> = .init(value: ())

    func transform(input: Input) -> Output {
        let pushViewController = input.viewDidAppearTrigger.asDriver(onErrorDriveWith: .never())
        return Output(pushViewController: pushViewController)
    }
    
}
