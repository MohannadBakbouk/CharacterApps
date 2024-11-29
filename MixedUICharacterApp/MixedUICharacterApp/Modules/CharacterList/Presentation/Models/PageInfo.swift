//
//  PageInfo.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
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
