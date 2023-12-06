//
//  BaseViewModel.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
// 

import RxSwift

class BaseViewModel {

    var disposeBag = DisposeBag()

    init() {
        DebugUtil.debugPrint("\(type(of: self)): init")
    }
    
    deinit {
        DebugUtil.debugPrint("\(type(of: self)): Deinited")        
    }
}

protocol BaseViewModelProtocol {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
