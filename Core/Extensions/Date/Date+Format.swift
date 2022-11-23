//
//  Date+Format.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public extension Date {
    
    static func dayOfWeek(timestamp: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let date = Date(timeIntervalSince1970: 1668973396)
        return dateFormatter.string(from: date)
    }
}
