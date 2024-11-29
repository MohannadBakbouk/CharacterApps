//
//  SuperXCTestCase.swift
//  MixedUICharacterAppUITests
//
//  Created by Mohannad on 28/11/2024.
//

import Foundation
import XCTest
import Swifter

enum APIPath {
   static let characters = "api/character"
}

enum APIFileResponse {
    static let characters = "CharactersResponse.json"
}

class SuperXCTestCase : XCTestCase {
    var app = XCUIApplication()
    let server = HttpServer()
    let port = 8090
    
    func initNormalServer(){
        do {
            let path = try TestUtil.path(for: APIFileResponse.characters, in: type(of: self))
            server[APIPath.characters] = shareFile(path)
            try server.start(in_port_t(port))
        }
        catch(let error){
            print(error)
            XCTAssert(false, "Swifter Server failed to start.")
        }
    }
    
    func switchToFailureServer(){
        server.stop()
        do {
            server[APIPath.characters] = { _ in
                return HttpResponse.internalServerError
            }
            try server.start(in_port_t(port))
        }
        catch{
            XCTAssert(false, "Swifter Server failed to start.")
        }
    }
}
