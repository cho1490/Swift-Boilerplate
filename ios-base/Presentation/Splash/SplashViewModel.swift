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
        let loadRequriedData: Observable<Void>
    }
    
    struct Output {
        let loadedRequiredData: PublishSubject<Void> = .init()
    }

    func transform(input: Input) -> Output {
        let output = Output()

        input.loadRequriedData.subscribe(onNext: {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                output.loadedRequiredData.onNext(())
            }
        }).disposed(by: disposeBag)

        return output
    }
    
}
