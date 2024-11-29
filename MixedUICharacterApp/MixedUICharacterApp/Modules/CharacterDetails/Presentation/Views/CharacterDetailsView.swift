//
//  CharacterDetailsView.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import SwiftUI
import Kingfisher

struct CharacterDetailsView: View {
    @StateObject var viewModel: CharacterDetailsViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(character: CharacterViewData) {
        self._viewModel = StateObject(wrappedValue: CharacterDetailsViewModel(info: character))
    }
    
    var body: some View {
        BaseView(state: $viewModel.state) {
            contentView
        }
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

extension CharacterDetailsView{
    var contentView: some View{
        VStack(spacing: 0) {
            headerView
            VStack(alignment: .leading, spacing: 0){
                titleStatusView
                speciesGenderView
                locationInfoView
            }.padding(.horizontal, 15)
            Spacer()
        }.ignoresSafeArea()
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .navigationBarBackButtonHidden(true)
    }
    
    var imageView: some View{
        KFImage(viewModel.character.imageUrl)
        .resizable()
        .scaledToFill()
        .frame(width: screenWidth, height: screenWidth)
        .clipped()
        .accessibilityIdentifier("CharacterImage")
    }
    
    var headerView: some View{
        ZStack(alignment: .topLeading){
            imageView
            backButton
        }.padding(.bottom, 15)
    }
    
    var backButton: some View{
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
            .tint(.main)
            .frame(width: 50, height: 50)
            .background(Circle().fill(.white))
            .padding(.leading, 30)
            .padding(.top, 50)
        }
        .accessibilityIdentifier("BackButton")
    }
    
    var titleView: some View{
        Text(viewModel.character.name)
        .multilineTextAlignment(.center)
        .fontWeight(.bold)
        .font(.title)
        .foregroundStyle(.main)
        .accessibilityIdentifier("CharacterName")
    }
    
    var statusView: some View{
         Text(viewModel.character.status.text)
        .font(.callout)
        .padding(.horizontal, 12)
        .frame(height: 35)
        .background(Color(.status).cornerRadius(17))
        .accessibilityIdentifier("CharacterStatus")
    }
    
    var titleStatusView: some View{
        HStack{
            titleView
            Spacer()
            statusView
        }
    }
    
    var speciesGenderView: some View{
        HStack{
            speciesView
            genderView
            Spacer()
        }.padding(.bottom, 20)
    }
    
    var speciesView: some View {
        Text("\(viewModel.character.species) ." )
        .foregroundStyle(.subtitle)
        .font(.callout)
        .fontWeight(.bold)
        .accessibilityIdentifier("CharacterSpecies")
    }
    
    var genderView: some View{
        Text(viewModel.character.gender)
       .foregroundStyle(.subtitle.opacity(0.7))
       .font(.callout)
       .fontWeight(.bold)
       .accessibilityIdentifier("CharacterGender")
    }
    
    var locationInfoView: some View{
        HStack{
            locationView
            locationValueView
            Spacer()
        }
    }
    
    var locationView: some View{
        Text("Location: ")
       .font(.callout)
       .fontWeight(.bold)
       .foregroundStyle(.main)
    }
    
    var locationValueView: some View{
        Text(viewModel.character.location)
       .font(.callout)
       .fontWeight(.bold)
       .foregroundStyle(.subtitle)
       .accessibilityIdentifier("CharacterLocation")
    }
}
