//
//  Numeric+FormatterWithSeparator.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public extension Numeric {
    
    var formattedWithSeparator: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter.string(for: self) ?? String(describing: self)
    }
    
    var formattedWithSeparatorAndTwoSymbols: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(for: self) ?? String(describing: self)
    }
    
    var formattedRounded: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .decimal
        return formatter.string(for: self) ?? String(describing: self)
    }
    
    var formattedWithComma: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(for: self) ?? ""
    }
}
