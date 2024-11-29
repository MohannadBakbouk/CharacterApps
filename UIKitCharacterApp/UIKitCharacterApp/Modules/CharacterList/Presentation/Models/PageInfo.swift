//
//  PageInfo.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

struct PageInfo{
    var current: Int
    var total: Int
    
    var areThereMore: Bool{
        current < total
    }
    
    init(){
        self.current = 1
        self.total = 0
    }
}
