//
//  DomainConvertible.swift
//  Storage
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public protocol IModelConvertible {

    associatedtype ModelType

    func asModel() -> ModelType
}

extension Array: IModelConvertible where Element: IModelConvertible {
    
    public func asModel() -> [Element.ModelType] {
        return map { $0.asModel() }
    }
}
