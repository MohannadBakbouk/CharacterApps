//
//  BaseView.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI
import SVProgressHUD

struct BaseView<Content: View>: View {
    let content: Content
    @Binding private var state: ViewModelState
    @Binding private var alertItem: AlertItem?
    @Binding private var toastItem: ToastItem?
    @State   private var isToastShowing: Bool
    @State   private var isAlertPresented: Bool
    init(state: Binding<ViewModelState>,
         alertItem: Binding<AlertItem?>? = nil,
        toastItem: Binding<ToastItem?>? = nil,
        @ViewBuilder content: () -> Content) {
        self._state = state
        self._alertItem = alertItem ?? .constant(nil)
        self._toastItem = toastItem ?? .constant(nil)
        self.isToastShowing = false
        self.isAlertPresented = false
        self.content = content()
    }
    
    var toastMessage: String{
        alertItem?.message ??  state.errorMessage ?? ""
    }
    
    var body: some View {
        ZStack {
            content.disabled(state == .loading)
            toastView
        } //: ZStack
        .onChange(of: state){ oldValue, newValue in
            didSetState(newValue)
        }
        .onChange(of: toastItem){ _, value in
            didSetToast(value)
        }
        .onChange(of: alertItem){ _, value in
            didSetAlert(value)
        }
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $isAlertPresented) {
            alertView
        }
    } //: body
    
    var toastView: some View{
        ToastView(message: toastMessage, isShowing: $isToastShowing)
        .willDisappear {
            toastItem = nil
            state = .idle
        }
    }
    
    var alertView: Alert{
        Alert(title: Text(alertItem?.title ?? ""),
            message: Text(alertItem?.message ?? ""),
            dismissButton: .default(Text("OK")))
    }
}

private extension BaseView {
    func didSetState(_ state: ViewModelState) {
        state == .loading ? showLoadingIndicator() : hideLoadingIndicator()
        guard let message = state.errorMessage , !message.isEmpty else { return }
        isToastShowing = true
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func showToastAlert(_ message: String?, toastType: ToastItemType) {
        guard let message: String = message else { return }
        toastItem = ToastItem(message: message, type: toastType)
        didSetToast(toastItem)
    }
    
    func didSetToast(_ item: ToastItem?) {
        guard let _ = item else { return }
        isToastShowing.toggle()
    }
    
    func didSetAlert(_ alert: AlertItem?) {
        guard let _ = alert else { return }
        isAlertPresented.toggle()
    }
}
