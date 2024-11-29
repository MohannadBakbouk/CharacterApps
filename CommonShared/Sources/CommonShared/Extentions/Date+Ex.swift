//
//  Date+Ex.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public extension Date{
    var year: Int{
         Calendar.current.component(.year, from: self)
    }
}
