//
//  SplashViewModel.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import RxSwift

class SplashViewModel: BaseViewModel, BaseViewModelProtocol {
    
    struct Input {
        let readyToLaunch: PublishSubject<Void>
    }
    
    struct Output {
        let pushNextViewController: Observable<Void>
    }
     
    func transform(input: Input) -> Output {
        let pushNextViewController = Observable.of(input.readyToLaunch).merge()
        return Output(pushNextViewController: pushNextViewController)
    }        
    
}
