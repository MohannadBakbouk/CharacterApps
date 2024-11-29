//
//  Dictionary+Ex.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public extension Dictionary {
    var asData: Data?{
        let json = try? JSONSerialization.data(withJSONObject: self)
        return json
    }
    
    var asQueryItems: [URLQueryItem]{
        self.map{URLQueryItem(name: String(describing: $0.key), value: String(describing: $0.value))}
    }
    
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
