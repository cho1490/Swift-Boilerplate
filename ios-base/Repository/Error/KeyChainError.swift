//
//  KeyChainError.swift
//  ios-base
//
//  Created by 조상현 on 11/27/23.
//  Copyright © 2023 ChoSangHyun. All rights reserved.
//

import Foundation

enum KeychainError: Error {
    case FunctionNotImplemented
    case InvalidParameters
    case MemoryAllocationError
    case KeychainNotAvailable
    case DuplicateItem
    case ItemNotFound
    case InteractionNotAllowed
    case DecodingError
    case AuthenticationFailed
    
    init?(error: OSStatus) {
        switch error {
        case errSecUnimplemented:
            self = .FunctionNotImplemented
        case errSecParam:
            self = .InvalidParameters
        case errSecAllocate:
            self = .MemoryAllocationError
        case errSecNotAvailable:
            self = .KeychainNotAvailable
        case errSecDuplicateItem:
            self = .DuplicateItem
        case errSecItemNotFound:
            self = .ItemNotFound
        case errSecInteractionNotAllowed:
            self = .InteractionNotAllowed
        case errSecDecode:
            self = .DecodingError
        case errSecAuthFailed:
            self = .AuthenticationFailed
        default:
            return nil
        }
    }
    
    /// A description of the error. Not localized.
    var errorDescription: String {
        switch self {
        case .FunctionNotImplemented:
            return "Function or operation not implemented."
        case .InvalidParameters:
            return "One or more parameters passed to a function were not valid."
        case .MemoryAllocationError:
            return "Failed to allocate memory."
        case .KeychainNotAvailable:
            return "No keychain is available. You may need to restart your computer."
        case .DuplicateItem:
            return "The specified item already exists in the keychain."
        case .ItemNotFound:
            return "The specified item could not be found in the keychain."
        case .InteractionNotAllowed:
            return "User interaction is not allowed."
        case .DecodingError:
            return "Unable to decode the provided data."
        case .AuthenticationFailed:
            return "The user name or passphrase you entered is not correct."
        }
    }
}

enum KeyChainHelperError: Error {
    case DataConvertFailed
    case BundleIdDoesNotExist
}
