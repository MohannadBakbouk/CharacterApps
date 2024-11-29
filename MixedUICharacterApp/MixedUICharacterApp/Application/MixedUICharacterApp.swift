//
//  MixedUICharacterAppApp.swift
//  MixedUICharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import SwiftUI

@main
struct MixedUICharacterApp: App {
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
