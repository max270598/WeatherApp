//
//  IRealmRepresentable.swift
//  Storage
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public protocol IRealmRepresentable {
    associatedtype RealmType: IModelConvertible

    func asRealm() -> RealmType
}
