//
//  ErrorViewData.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import CommonShared

struct ErrorViewData{
    var title : String
    var message : String
    var icon : String
}

extension ErrorViewData {
    init(message : String){
        self.init(title : "Error" , message : message , icon : Images.exclamationmark)
    }
    
    init (with error : NetworkError){
        self.init(title : "Error" , message : error.message , icon : Images.exclamationmark)
    }
}
