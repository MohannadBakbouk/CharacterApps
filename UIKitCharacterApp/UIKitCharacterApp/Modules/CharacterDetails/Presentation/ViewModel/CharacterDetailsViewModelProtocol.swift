//
//  CharacterDetailsViewModelProtocol.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//
import Foundation
import  Combine

protocol CharacterDetailsViewModelProtocol: BaseViewModelProtocol{
    var details: CurrentValueSubject<CharacterViewData?, Never>{get}
}
