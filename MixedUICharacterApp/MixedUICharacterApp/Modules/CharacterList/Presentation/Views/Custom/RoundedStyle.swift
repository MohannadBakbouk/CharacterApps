//
//  RoundedStyle.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import SwiftUI

struct RoundedStyle: ButtonStyle {
    var cornerRadius: CGFloat = 25
    var borderColor: Color = .darkBorder
    var lineWidth: CGFloat = 2
    var horizontalPadding: CGFloat = 15
    var verticalPadding: CGFloat = 10
    var isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .font(.headline)
        .foregroundColor(.main)
        .padding(.vertical, verticalPadding)
        .padding(.horizontal, horizontalPadding)
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

