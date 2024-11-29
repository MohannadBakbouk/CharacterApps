//
//  CharacterListViewModel.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import Combine

final class CharacterListViewModel: BaseViewModel{
    @Published var characters: [CharacterViewData]
    @Published var selectedStatus: StatusViewData?
    @Published var isLoadingMore: Bool
    private var service:  CharacterServiceProtocol
    private var pageInfo: PageInfo
    typealias Row = CollectionRow<Int, CharacterViewData>
    
    init(service: CharacterServiceProtocol = CharacterService()) {
        self.service = service
        self.characters = []
        self.selectedStatus = nil
        self.isLoadingMore = false
        self.pageInfo = PageInfo()
        super.init()
        observeSelectedStatus()
    }
    
    private func loadCharaters(status: StatusViewData?){
          _ = pageInfo.current == 1 ? state = .loading : ()
          let delay = pageInfo.current == 1 &&  ProcessInfo.isReal ? 2 : 0
          service.fetchCharacter(page: pageInfo.current, status: status?.rawValue.lowercased())
         .receive(on: RunLoop.main)
         .delay(for: .seconds(delay), scheduler: RunLoop.main) // 2 sec delay to show the loading status
         .sink {[weak self] completed in
             self?.isLoadingMore = false
             guard case .failure(let error) = completed else {return}
             self?.state = .failed(errorMessage: error.message)
         } receiveValue: {[weak self] response in
             let items = response.results.map{CharacterViewData(info: $0)}
             self?.characters.append(contentsOf: items)
             self?.pageInfo.total = response.info.pages
             self?.state = .successful
         }.store(in: &cancellables)
     }
     
     private func observeSelectedStatus(){
         $selectedStatus
         .dropFirst()
         .sink {[weak self] value in
             self?.characters = []
             self?.pageInfo = PageInfo()
             self?.loadCharaters(status: value)
         }.store(in: &cancellables)
     }
 }


 extension CharacterListViewModel{
     func onAppear(){
         loadCharaters(status: nil)
     }
     
     func loadNextPage(){
         guard pageInfo.areThereMore else {return}
         isLoadingMore = true
         pageInfo.current += 1
         loadCharaters(status: selectedStatus)
     }
}
