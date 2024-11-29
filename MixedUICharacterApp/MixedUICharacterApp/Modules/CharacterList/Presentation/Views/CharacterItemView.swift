//
//  CharacterItemView.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import SwiftUI
import Kingfisher

struct CharacterItemView: View {
    var character: CharacterViewData
    var body: some View{
        ZStack{
            backgroundView
            contentView
        }
    }
    
    var contentView: some View{
        HStack{
            imageView
            nameSpeciesView
            Spacer()
        }.padding()
    }
    
    var backgroundView: some View{
        RoundedRectangle(cornerRadius: 15)
        .stroke(Color.gray.opacity(0.3),lineWidth: character.style.hasBorder ? 0.5 : 0)
        .background(character.style.background.cornerRadius(16))
    }
    
    var nameSpeciesView: some View{
        VStack(alignment: .leading, spacing: 8){
            nameView
            speciesView
            Spacer()
        }.padding(.vertical, 10)
    }
    
    var nameView: some View{
        Text(character.name)
        .multilineTextAlignment(.leading)
        .fontWeight(.bold)
        .font(.headline)
        .foregroundStyle(.main)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var speciesView: some View{
        Text(character.species)
        .foregroundStyle(.subtitle)
    }
    
    var imageView: some View{
         KFImage(character.imageUrl)
        .resizable()
        .fade(duration: 0.25)
        .scaledToFill()
        .frame(width: 80, height: 80)
        .cornerRadius(8)
    }
}
