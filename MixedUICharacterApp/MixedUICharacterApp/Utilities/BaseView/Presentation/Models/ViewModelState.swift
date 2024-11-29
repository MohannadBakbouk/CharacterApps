//
//  ViewModelState.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation

public enum ViewModelState {
    case idle
    case loading
    case failed(errorMessage: String)
    case successful
    case successfulWithMessage(message: String)
}

public extension ViewModelState {
    var errorMessage: String? {
        guard case .failed(let errorMessage) = self else {
            guard case .successfulWithMessage(let errorMessage) = self else { return nil }
            return errorMessage
        }
        return errorMessage
    }
    
    var isFailed: Bool {
        return self == .failed(errorMessage: "")
    }
    
    var isSuccessfulWithMessage: Bool {
        return self == .successfulWithMessage(message: "")
    }
}

extension ViewModelState: Equatable {
    public static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.successful, .successful): return true
        case (.failed(_), .failed(_)): return true
        case (.successfulWithMessage(_), .successfulWithMessage(_)): return true
        default:
            return false
        }
    }
}
