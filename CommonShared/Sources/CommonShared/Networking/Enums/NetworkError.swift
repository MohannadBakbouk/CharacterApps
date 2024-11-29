//
//  NetworkError.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public enum NetworkError: Int,  Error {
    case unAuthorized
    case forbidden
    case notFound
    case server
    case parse
    case invalidUrl
    case internetOffline
    case invalidHostname
    case errorOccured
    
    public var message : String {
        switch self {
            case .internetOffline:  return ErrorMessage.internet
            case .server: return ErrorMessage.server
            case .errorOccured: return ErrorMessage.general
            case .parse: return ErrorMessage.parsing
            case .notFound : return ErrorMessage.notFound
            case .invalidHostname: return ErrorMessage.hostNameNotFound
            default: return ErrorMessage.anInternal
        }
    }
    
    static func convert(_ error : Error?) -> NetworkError{
        guard error as? NetworkError == nil else {return error as! NetworkError}
        
        guard !(error is DecodingError) else {return NetworkError.parse}
        
        guard let mapped = error as? URLError else {return .errorOccured}
        
        switch mapped.code {
          case .notConnectedToInternet : return .internetOffline
          case .timedOut: return .internetOffline
          case .cannotDecodeContentData: return .parse
          case .cannotDecodeRawData: return .parse
          case .appTransportSecurityRequiresSecureConnection: return .invalidUrl
          case .unsupportedURL: return .invalidUrl
          case .cannotFindHost : return .invalidHostname
          default: return .errorOccured
        }
    }
    
    static func convert(_ code : Int?) -> NetworkError?{
        return code == 401 ? .unAuthorized : code == 403 ? .forbidden : code == 404 ? .notFound :  code == 500 ? .server : nil
    }
}
