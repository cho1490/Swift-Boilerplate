//
//  BaseViewModel.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
// 

class BaseViewModel {
  
    var service: NetworkProtocol?
    
    init(service: NetworkProtocol? = nil) {
        self.service = service
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
