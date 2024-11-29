//
//  CharacterItemView.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI
import Kingfisher

struct CharacterItemView: View {
    var character: CharacterViewData
    var body: some View {
         contentView
        .listRowInsets(.init(.zero))
        .listSectionSeparator(.hidden)
        .background(Color(.secondaryBackground))
        .cornerRadius(15)
        .padding(.bottom, 15) // set a space between rows
        .background(Color(.background)) // set space between rows color
        .listRowBackground(Color.red)
    }
}

extension CharacterItemView{
    
    var contentView: some View{
        HStack{
            imageView
            infoView
            Spacer()
        }
    }
    
    
    var imageView: some View{
        KFImage(character.imageUrl)
       .resizable()
       .fade(duration: 0.25)
       .frame(width: 150, height: 150)
       .clipped()
    }
    
    var infoView: some View{
        VStack(alignment: .leading, spacing: 8){
            nameView
            statusTypeView
            genderView
            releaseView
        }.padding(.vertical, 10)
    }
    
    var nameView: some View{
        Text(character.name)
        .multilineTextAlignment(.leading)
        .fontWeight(.bold)
        .font(.headline)
        .foregroundStyle(.red)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var statusTypeView: some View{
        HStack{
            Circle()
            .fill(character.status.color)
            .frame(width: 12, height: 12)
            
            Text(character.status.text)
            .font(.subheadline)
            .foregroundStyle(.gray)
            
            Spacer()
        }
    }
    
    var releaseView: some View{
        HStack{
            Image(systemName: "calendar.circle.fill")
            .resizable()
            .frame(width: 15, height: 15)
            .foregroundStyle(.white)
            
            Text(character.release)
            .foregroundStyle(.gray)
            
            Spacer()
        }
    }
    
    var genderView: some View{
        HStack{
            Image(systemName: "tag.circle.fill")
            .resizable()
            .frame(width: 15, height: 15)
            .foregroundStyle(.white)
            
            Text(character.gender)
            .foregroundStyle(.gray)
            
            Spacer()
        }
    }
}
