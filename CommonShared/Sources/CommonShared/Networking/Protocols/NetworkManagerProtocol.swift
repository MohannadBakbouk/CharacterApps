//
//  File.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine

public typealias JSON = [String : Any]

public protocol  NetworkManagerProtocol {
    func request<T: Codable>(endpoint: EndpointProtocol) -> AnyPublisher<T, NetworkError>
    func call<T: Codable>(request: URLRequest) -> AnyPublisher<T, NetworkError>
}
