//
//  NetworkConfigurations.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import CommonShared

final class NetworkConfigurations: NetworkConfigurationsProtocol{
    var baseUrl: String
    var isLoggingEnabled: Bool
    var application: String
    var version: String
    var lang: String
    var accessToken: String?
    
    init() {
        self.baseUrl = ProcessInfo.isReal ? ConstantValues.apiUrl : ConstantValues.mockedUrl
        self.isLoggingEnabled = true
        self.application = "Charaters"
        self.version = "1.0.0"
        self.lang = "En"
        self.accessToken = nil
    }
}
