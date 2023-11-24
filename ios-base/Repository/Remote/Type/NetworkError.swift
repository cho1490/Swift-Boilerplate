//
//  NetworkError.swift
//  ios-base
//
//  Created by 조상현 on 11/22/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

enum NetworkError: Error {
    case invalidUrl
    case statusCodeError
    case decodingFailed
}
