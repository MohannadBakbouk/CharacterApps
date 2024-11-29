//
//  RoundedStyle.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI

struct RoundedStyle: ButtonStyle {
    var cornerRadius: CGFloat = 25
    var borderColor: Color = .white
    var lineWidth: CGFloat = 2
    var paddingValue: CGFloat = 10
    var isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .font(.headline)
        .foregroundColor(isSelected ? .background :  borderColor)
        .padding(paddingValue)  // Padding inside the button
        .background(backgroundView)
        .padding(.vertical, 8)
        .padding(.horizontal, 2)
        .opacity(configuration.isPressed ? 0.5 : 1)
    }
    
    
    var backgroundView: AnyView{
        isSelected
        ? RoundedRectangle(cornerRadius: cornerRadius).fill(borderColor).toAnyView()
        : RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: lineWidth).toAnyView()
    }
}

extension ButtonStyle where Self == RoundedStyle{
    static func RoundedStyle(isSelected: Bool) -> Self{
        return .init(isSelected: isSelected)
    }
}

