//
//  CharacterListView.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI
import Combine

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    @State var screenStack:[CharacterViewData] = []
    
    init() {
        self._viewModel = StateObject(wrappedValue: CharacterListViewModel())
    }
    
    
    var body: some View {
        BaseView(state: $viewModel.state, alertItem: $viewModel.alertItem,
                 toastItem: $viewModel.toastItem) {
            NavigationStack(path: $screenStack){
                contentView
            }
           
        }.onAppear(perform: viewModel.onAppear)
    }
}

extension CharacterListView{
    var contentView: some View{
        VStack(alignment: .leading) {
            titleView
            statusView
            listItemsView
            Spacer()
        }.padding()
         .background(Color(.background))
         .ignoresSafeArea(edges: .bottom)
         .navigationDestination(for: CharacterViewData.self) {value in
             CharacterDetailsView(character: value)
         }
    }
    
    var titleView: some View{
        Text("Characters")
        .fontWeight(.bold)
        .font(.largeTitle)
        .foregroundStyle(.red)
    }
    
    var statusView: some View{
        StatusView(selectedStatus: $viewModel.selectedStatus)
       .accessibilityIdentifier("StatusView")
    }
    
    var listItemsView: some View{
        List{
            ForEach(Array(viewModel.characters.enumerated()), id: \.element.id){ index, item in
                makeItemView(index: index, item: item)
            }
        }.scrollIndicators(.hidden)
        .listStyle(.plain)
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("Collection")
    }
    
    func makeItemView(index: Int, item: CharacterViewData) -> some View{
         CharacterItemView(character: item)
        .onTapGesture {screenStack.append(item)}
        .onAppear{
           guard (viewModel.characters.count - 1) == index , !viewModel.isLoadingMore else {return}
           viewModel.loadNextPage()
       }
    }
}

#Preview {
    CharacterListView()
}
