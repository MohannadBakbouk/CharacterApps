//
//  ErrorMessage.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

enum ErrorMessage{
    static let  internet = "Please make sure you are connected to the internet"
    static let  server = "an internal error occured in server side please try again later"
    static let  general = "Something went wrong"
    static let  parsing = "an internal error occured while parsing the request please try again later"
    static let  anInternal = "an internal error occured"
    static let  notFound = "the url you have requested is not exited"
    static let  hostNameNotFound =  "the host you have requested is not existed"
}
