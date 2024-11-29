//
//  NetworkManager.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine

final public class NetworkManager: NetworkManagerProtocol {
    
    private var configurations: NetworkConfigurationsProtocol!
    private var logger: NetworkLoggerProtocol
    
    public init(_ configurations: NetworkConfigurationsProtocol) {
        self.configurations = configurations
        self.logger = NetworkLogger(isLoggingEnabled: configurations.isLoggingEnabled)
    }
    
    public func request<T>(endpoint: EndpointProtocol) -> AnyPublisher<T, NetworkError> where T : Codable {
        guard var urlComponents = URLComponents(string: configurations.baseUrl) else {return AnyPublisher(Fail<T, NetworkError>(error: .invalidUrl))}
        urlComponents.path = endpoint.path
        _ =  (endpoint.method == .Get || endpoint.method == .Delete) && endpoint.params.count > 0 ? urlComponents.queryItems = endpoint.params.asQueryItems : ()
        guard let url =  urlComponents.url else {return AnyPublisher(Fail<T, NetworkError>(error: .invalidUrl))}
        var request = URLRequest(url: url)
        request.httpMethod =  endpoint.method.rawValue
        request.addValue(endpoint.contentType, forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = (endpoint.method == .Post || endpoint.method == .Put) ? endpoint.body : nil
        return call(request: request)
    }
    
    public func call<T>(request: URLRequest) -> AnyPublisher<T, NetworkError> where T: Codable {
        return URLSession.shared
        .dataTaskPublisher(for: request)
        .handleEvents(receiveOutput: {[weak self] output in
            self?.logger.log(request: request, data: output.data, response: output.response)
        })
        .tryMap{[weak self]  output in
            try self?.validate(response: output.response, data: output.data)
            return output.data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .mapError {[weak self] error in
            self?.logger.log(request: request, error: error)
            return NetworkError.convert(error)
        }
        .retry(3)
        .eraseToAnyPublisher()
    }
    
    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {throw NetworkError.errorOccured}
        guard httpResponse.statusCode != 200 else { return}
        throw NetworkError.convert((response as? HTTPURLResponse)?.statusCode) ?? .errorOccured
    }
}
