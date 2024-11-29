//
//  EndpointProtocol.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public protocol EndpointProtocol{
    var path: String{get}
    var params: JSON {get}
    var method: HttpMethod{get}
    var body: Data?{get}
    var contentType: String{get}
}

public extension EndpointProtocol{
    var contentType: String{
        return "application/json; charset=utf-8"
    }
    
    var params: JSON{
        [:]
    }
    
    var body: Data?{
        return nil
    }
}
