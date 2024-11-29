//
//  CharacterListViewModel.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine

final class CharacterListViewModel: CharacterListViewModelProtocol{
    var cancellables: Set<AnyCancellable>
    var isLoading: PassthroughSubject<Bool, Never>
    var error: CurrentValueSubject<ErrorViewData?, Never>
    var service: CharacterServiceProtocol
    var characters: CurrentValueSubject<[CharacterViewData], Never>
    var reachedBottomTrigger: PassthroughSubject<Void, Never>
    var isLoadingMore: CurrentValueSubject<Bool, Never>
    var pageInfo: PageInfo
    @Published var selectedStatus: StatusViewData?
    
    init(service: CharacterServiceProtocol) {
        self.cancellables = []
        self.isLoading = PassthroughSubject()
        self.error = CurrentValueSubject(nil)
        self.characters = CurrentValueSubject([])
        self.reachedBottomTrigger = PassthroughSubject()
        self.isLoadingMore = CurrentValueSubject(false)
        self.service = service
        self.pageInfo = PageInfo()
        self.selectedStatus = nil
        self.observeOnReachedBottomTrigger()
        self.observeOnSelectedStatus()
    }
    
    func loadCharacters(status: StatusViewData? = nil){
        _ = !isLoadingMore.value ? isLoading.send(true) : ()
        let delay = !isLoadingMore.value ? 2 : 0

        service.fetchCharacter(page: pageInfo.current, status: status?.rawValue)
       .delay(for: .seconds(delay), scheduler: RunLoop.main)
       .sink(receiveCompletion: {[weak self] completed in
            self?.isLoadingMore.send(false)
            guard case .failure(let error) = completed else {return}
            self?.isLoading.send(false)
            self?.error.send(ErrorViewData(with: error))
       }, receiveValue: {[weak self] response in
           self?.isLoading.send(false)
           var characters = (self?.characters.value ?? [])
           characters.append(contentsOf: response.results.map{CharacterViewData(info: $0)})
           self?.characters.send(characters)
           self?.pageInfo.total = response.info.pages
       }).store(in: &cancellables)
    }

    private func observeOnReachedBottomTrigger(){
        reachedBottomTrigger
        .filter{ [weak self] in
            guard let self = self else { return false}
            return self.pageInfo.areThereMore && !isLoadingMore.value
        }
        .sink{[weak self] _ in
            self?.pageInfo.current += 1
            self?.isLoadingMore.send(true)
            self?.loadCharacters(status: self?.selectedStatus)
        }.store(in: &cancellables)
    }
    
    private func observeOnSelectedStatus(){
        $selectedStatus
        .dropFirst()
        .sink {[weak self] value in
            self?.characters.send([])
            self?.pageInfo = PageInfo()
            self?.loadCharacters(status: value)
        }.store(in: &cancellables)
    }
}
