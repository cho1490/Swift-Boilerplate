//
//  AViewModel.swift
//  ios-base
//
//  Created by 조상현 on 11/24/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import RxSwift
import RxCocoa
 
final class AViewModel: BaseViewModel, BaseViewModelProtocol {
 
    struct Input {
    }

    struct Output {
    }
     
    func transform(input: Input) -> Output {
        Output()
    }
     
}
