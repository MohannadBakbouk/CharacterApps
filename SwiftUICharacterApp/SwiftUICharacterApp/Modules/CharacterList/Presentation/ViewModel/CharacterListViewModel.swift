//
//  CharacterListViewModel.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import Combine
import UIKit
import SVProgressHUD

final class CharacterListViewModel: BaseViewModel{
    @Published var characters: [CharacterViewData]
    @Published var selectedStatus: StatusViewData
    private var service:  CharacterServiceProtocol
    var isLoadingMore: Bool
    var pageInfo: PageInfo
   
    init(service: CharacterServiceProtocol = CharacterService()) {
        self.service = service
        self.characters = []
        self.pageInfo = PageInfo()
        self.selectedStatus = .all
        self.isLoadingMore = false
        super.init()
        self.observeSelectedStatus()
    }
    
   private func loadCharaters(status: StatusViewData){
         _ = pageInfo.current == 1 ? state = .loading : ()
         let delay = pageInfo.current == 1 && ProcessInfo.isReal ? 2 : 0
         let status = status == .all ?  nil : status.rawValue.lowercased()
         service.fetchCharacter(page: pageInfo.current, status: status)
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
        loadCharaters(status: .all)
    }
    
    func loadNextPage(){
        guard pageInfo.areThereMore else {return}
        isLoadingMore = true
        pageInfo.current += 1
        loadCharaters(status: selectedStatus)
    }
}
