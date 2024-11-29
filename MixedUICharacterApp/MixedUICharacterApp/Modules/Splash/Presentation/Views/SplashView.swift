//
//  SplashView.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    var body: some View {
       contentView
    }
    
    var contentView: some View{
        VStack{
            Spacer()
           
            Text("Mixed UI Characters App")
           .fontWeight(.bold)
           .multilineTextAlignment(.center)
           .font(.largeTitle)
           .foregroundStyle(.main)
           .padding()
           .accessibilityIdentifier("SlugLabel")
            
            Spacer()
            
            ProgressView()
           .tint(.main)
           .scaleEffect(2)
           .accessibilityIdentifier("ProgressView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 40)
        .onAppear(perform: onApear)
    }
    
    func onApear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                isActive = false
            }
        }
    }
}
