//
//  Optional+IsNil.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public extension Optional {
    
    var isNil: Bool {
        return self == nil
    }
}

extension Optional: LosslessStringConvertible {
    
    public init?(_ description: String) {
        return nil
    }
    
    public var description: String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case .none:
            return ""
        }
    }
}
