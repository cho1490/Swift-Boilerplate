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
        debugPrint("\(type(of: self)): init")
    }
    
    deinit {
        debugPrint("\(type(of: self)): Deinited")        
    }
}

protocol BaseViewModelProtocol {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
