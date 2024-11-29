//
//  ProcessInfo+Ex.swift
//  
//
//  Created by Mohannad on 28/11/2024.
//

import Foundation

public extension ProcessInfo{
    class var isTesting: Bool{
        ProcessInfo.processInfo.arguments.contains("-uitesting")
    }
    
    class var isReal: Bool{
        !ProcessInfo.processInfo.arguments.contains("-uitesting")
    }
}
