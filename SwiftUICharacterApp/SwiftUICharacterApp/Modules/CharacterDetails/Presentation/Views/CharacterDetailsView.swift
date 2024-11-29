//
//  CharacterDetailsView.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
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
        VStack {
            headerView
            titleView
            moreInfoView
            Spacer()
        }.background(Color(.background))
        .ignoresSafeArea()
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
        }
    }
    
    var backButton: some View{
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
           Image(systemName: "arrow.left.circle")
          .resizable()
          .frame(width: 30, height: 30)
          .foregroundStyle(.red)
          .padding(.leading, 30)
          .padding(.top, 50)
        }.accessibilityIdentifier("BackButton")
    }
    
    var titleView: some View{
        Text(viewModel.character.name)
        .multilineTextAlignment(.center)
        .fontWeight(.bold)
        .font(.largeTitle)
        .foregroundStyle(.red)
        .padding()
        .accessibilityIdentifier("CharacterName")
    }
    
    var moreInfoView: some View{
        VStack(alignment: .leading, spacing: 15) {
            ForEach(TinyInfoType.allCases, id: \.hashValue){item in
                TinyInfoItemView(info: viewModel.makeTinyInfoViewData(item: item))
                .accessibilityIdentifier("Character\(String(describing: item).capitalized)")
            }
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
