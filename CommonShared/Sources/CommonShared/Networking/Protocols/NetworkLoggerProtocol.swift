//
//  NetworkLoggerProtocol.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public protocol NetworkLoggerProtocol{
    var  isLoggingEnabled: Bool {get set}
    func log(request: URLRequest, data: Data, response: URLResponse)
    func log(request: URLRequest, error: Error)
}
