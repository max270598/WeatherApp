//
//  Date+Format.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public extension Date {
    
    static func dayAndTime(timestamp: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "EEEE h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let date = Date(timeIntervalSince1970: timestamp)
        return dateFormatter.string(from: date)
    }
}
