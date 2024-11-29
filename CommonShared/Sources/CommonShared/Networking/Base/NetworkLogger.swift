//
//  NetworkLogger.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation


public class NetworkLogger: NetworkLoggerProtocol{
    
    public var isLoggingEnabled: Bool
    
    init(isLoggingEnabled: Bool) {
        self.isLoggingEnabled = isLoggingEnabled
    }
    
    public func log(request: URLRequest, data: Data, response: URLResponse){
       guard isLoggingEnabled else {return}
       print("\n - - - - - - - - - - - - Request Details - - - - - - - - - - - - \n")
       print("URL: \(request.url?.absoluteString ?? "nil")\n")
       print("Method: \(request.httpMethod ?? "nil")\n")
       print("Headers: \(request.allHTTPHeaderFields ?? [:])\n")
       if let body = request.httpBody {
           print("Body: \(String(data: body, encoding: .utf8) ?? "nil") \n")
       }
       if let httpResponse = response as? HTTPURLResponse {
           let responseHeaders = httpResponse.allHeaderFields.map{($0.key.description, $0.value)}
           print("Status Code: \(httpResponse.statusCode) \n")
           print("Headers: \(responseHeaders) \n")
           if let body = String(data: data, encoding: .utf8) {
               print("Body: \(body.utf8) \n")
           }
        }
        
       print("\n - - - - - - - - - - - - End - - - - - - - - - - - - \n")
    }
    
    public func log(request: URLRequest, error: Error){
        guard isLoggingEnabled else {return}
        print("\n - - - - - - - - - - - - Request Error - - - - - - - - - - - - \n")
        print("URL: \(request.url?.absoluteString ?? "nil") \n")
        print("Error: \(error) \n")
        print("\n - - - - - - - - - - - - End - - - - - - - - - - - - \n")
    }
}
