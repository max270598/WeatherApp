//
//  String+Extensions.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public extension String {
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
