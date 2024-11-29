//
//  AlertItem.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import UIKit

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String?
    let message: String?
    let style: UIAlertController.Style
    let actions: [AlertAction]
    
    init(
        title: String? = nil,
        message: String?,
        style: UIAlertController.Style = .alert,
        actions: [AlertAction] = []
    ) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
    }
}

extension AlertItem: Equatable {
    static func == (lhs: AlertItem, rhs: AlertItem) -> Bool {
        lhs.id == rhs.id
    }
}


import UIKit

struct AlertAction {
    typealias Action = () -> Void
    
    let title: String
    let style: UIAlertAction.Style
    var action: Action?

    init(
        title: String,
        style: UIAlertAction.Style = .default,
        action: Action? = nil
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}

extension AlertAction {
    var toUIAlertAction: UIAlertAction {
        UIAlertAction(
            title: title,
            style: style
        ) { _ in
            self.action?()
        }
    }
}


struct ToastItem {
    var message: String
    var type: ToastItemType
}

extension ToastItem: Equatable {
    static func == (lhs: ToastItem, rhs: ToastItem) -> Bool {
        lhs.message == rhs.message
    }
}

import Foundation
import UIKit

enum ToastItemType {
    case error
    case alert
    case success
}

extension ToastItemType {
    var color: UIColor {
        switch self {
        case .error:
            return .red
            
        case .alert:
            return UIColor.black
            
        case .success:
            return .green
        }
    }
}
