//
//  SwiftUICharacterApp.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import SwiftUI

@main
struct SwiftUICharacterApp: App {
    @State var isSplashShown: Bool = true
    var body: some Scene {
        WindowGroup {
            activeView
        }
    }
    
    var activeView: AnyView{
        isSplashShown ? SplashView(isActive: $isSplashShown).toAnyView() :  CharacterListView().toAnyView()
    }
}
