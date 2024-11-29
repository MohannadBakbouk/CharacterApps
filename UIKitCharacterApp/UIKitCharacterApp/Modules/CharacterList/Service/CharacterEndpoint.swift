//
//  CharacterEndpoint.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import CommonShared


enum CharacterEndpoint: EndpointProtocol{

    case fetchCharacters(page: Int, status: String?)
    
    var path: String{
        switch self {
            case .fetchCharacters: "/api/character"
        }
    }
    
    var method: HttpMethod{
        switch self {
            case .fetchCharacters: return .Get
        }
    }
    
    var params: JSON{
        switch self {
            case .fetchCharacters(let page, let status):
            var params: JSON = ["page": page]
                guard let status = status else {return params}
                params["status"] = status
                return params
            }
    }
    
}
