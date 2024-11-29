//
//  ContentView.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
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
            Text("SWiftUI Characters App")
            .multilineTextAlignment(.center)
           .fontWeight(.bold)
           .font(.largeTitle)
           .foregroundStyle(.red)
           .padding(.horizontal)
           .accessibilityIdentifier("SlugLabel")
           
            Spacer()
            
            ProgressView()
           .tint(.red)
           .scaleEffect(2)
           .accessibilityIdentifier("ProgressView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 40)
        .background(Color(.background))
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
