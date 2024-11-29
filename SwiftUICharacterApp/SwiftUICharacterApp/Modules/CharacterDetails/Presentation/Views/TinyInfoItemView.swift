//
//  TinyInfoItemView.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI

struct TinyInfoItemView: View {
    var info: TinyInfoViewData
    var body: some View {
        HStack{
            imageView
            valueView
            Spacer()
        }.padding(10)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(.secondaryBackground)))
    }
    
    var imageView: some View{
        Image(systemName: info.icon)
        .resizable()
        .frame(width: 20, height: 20)
        .foregroundStyle(.red)
    }
    
    var valueView: some View{
        Text(info.value)
        .font(.subheadline)
        .foregroundStyle(.white)
    }
}

