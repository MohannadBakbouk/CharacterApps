//
//  String+Ex.swift
//  
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation

public extension String {
    func asURL () -> URL?{
        return URL(string: self)
    }
}

public extension String{
    var toDate: Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
}
