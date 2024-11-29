//
//  CharacterListView.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import SwiftUI

typealias Row = CollectionRow<Int, CharacterViewData>

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    @State var screenStack: [CharacterViewData] = []
    @State var rows: [Row] = []
    
    init() {
        self._viewModel = StateObject(wrappedValue: CharacterListViewModel())
    }
        
    var body: some View {
        BaseView(state: $viewModel.state, alertItem: $viewModel.alertItem,
                 toastItem: $viewModel.toastItem) {
            NavigationStack(path: $screenStack){
                contentView
            }
        }.onAppear {
            viewModel.onAppear()
            rows = [CollectionRow(section: 1, items: viewModel.characters)]
        }
        .onChange(of: viewModel.characters) { _, _ in
            rows = [CollectionRow(section: 1, items: viewModel.characters)]
        }
    }
}

extension CharacterListView{
    
    var contentView: some View{
        VStack(alignment: .leading) {
            titleView
            statusView
            collectionView
            Spacer()
        }.padding()
            .navigationDestination(for: CharacterViewData.self) {value in
                CharacterDetailsView(character: value)
            }
    }
    
    var titleView: some View{
        Text("Characters")
        .fontWeight(.bold)
        .font(.largeTitle)
        .foregroundStyle(.main)
    }
    
    var statusView: some View{
        StatusView(selectedStatus: $viewModel.selectedStatus)
       .accessibilityIdentifier("StatusView")
    }
    
    var collectionView: some View{
         CollectionView(rows: rows, sectionLayoutProvider: createCollectionSection, cell: makeItemView)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accessibilityIdentifier("CharacterCollection")
        .ignoresSafeArea(.all)
    }
    
    func createCollectionSection(_ sectionIndex: Int,_  enviroment:  NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection{
        // Define the size for each item (cell)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(125)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(125)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .none
        section.boundarySupplementaryItems = []
        return section
    }
    
    func makeItemView(index: IndexPath, item: CharacterViewData) -> some View{
        GeometryReader { geometry in
            CharacterItemView(character: item)
            .frame(width: geometry.size.width)
            .onTapGesture {screenStack.append(item)}
            .onAppear{
                guard (viewModel.characters.count - 1) == index.row , !viewModel.isLoadingMore else {return}
                viewModel.loadNextPage()
           }
        }
    }
}

#Preview {
    CharacterListView()
}
