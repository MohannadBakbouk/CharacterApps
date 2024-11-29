//
//  ToastView.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import SwiftUI

struct ToastView: View {
    var message: String
    @Binding var isShowing: Bool
    private var willDisappear: (() -> Void)?
    
    init(message: String, isShowing: Binding<Bool>) {
        self.message = message
        self._isShowing = isShowing
    }
    
    let duration: TimeInterval = 3.0
    
    var body: some View {
        VStack {
            Spacer()
            if isShowing {
                textView
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    var textView: some View{
        Text(message)
        .padding()
        .background(Color.black.opacity(0.7))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
        .transition(.move(edge: .bottom))
        .animation(.easeInOut(duration: 0.5), value: isShowing)
        .frame(maxWidth: .infinity)
        .onAppear(perform: onAppear)
    }
    
    func onAppear(){
        // Automatically dismiss after the duration
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            isShowing = false
            willDisappear?()
        }
    }
    
    func willDisappear(action: @escaping () -> Void) -> ToastView{
        var view = self
        view.willDisappear = action
        return view
    }
}
