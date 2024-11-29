//
//  NetworkConfigurationsProtocol.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public protocol NetworkConfigurationsProtocol{
    var baseUrl:String{get set}
    var isLoggingEnabled: Bool {get set}
    var application: String{get set}
    var version: String{get set}
    var lang: String{get set}
    var accessToken: String?{get set}
}
