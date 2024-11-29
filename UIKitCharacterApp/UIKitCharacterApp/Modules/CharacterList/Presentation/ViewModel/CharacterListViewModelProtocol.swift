//
//  CharacterListViewModelProtocol.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import  Combine

protocol CharacterListViewModelProtocol: BaseViewModelProtocol{
    var characters: CurrentValueSubject<[CharacterViewData], Never>{get}
    var reachedBottomTrigger: PassthroughSubject<Void, Never> {get}
    var isLoadingMore: CurrentValueSubject<Bool, Never> { get }
    var pageInfo: PageInfo{get}
    func loadCharacters(status: StatusViewData?)
    
}
