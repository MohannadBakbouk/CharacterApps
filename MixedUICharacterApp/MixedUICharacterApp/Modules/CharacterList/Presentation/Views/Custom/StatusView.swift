//
//  StatusView.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import SwiftUI

struct StatusView: View {
    @Binding var selectedStatus: StatusViewData?
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(StatusViewData.allCases, id: \.rawValue){ item in
                    makeButton(item: item)
                }
            }
        }
    }
    
    func makeButton(item: StatusViewData) -> some View{
        Button {
            selectedStatus = item
        } label: {
           Text(item.rawValue)
        }
        .buttonStyle(.RoundedStyle(isSelected: selectedStatus == item))
    }
}
