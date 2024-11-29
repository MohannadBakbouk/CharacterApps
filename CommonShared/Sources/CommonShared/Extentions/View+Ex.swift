//
//  View+Ex.swift
//  
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI

public extension View {
    func toAnyView() -> AnyView {
        return AnyView(self)
    }
}
