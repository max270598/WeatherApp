//
//  IStorageClient.swift
//  Storage
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public protocol IStorageClient {

    associatedtype ModelType

    func save(values: [ModelType])
    func save(value: ModelType)
    
    func load(id: String?) -> ModelType?
    func load(uuid: UUID?) -> ModelType?
    func loadWithPredicate(predicate: NSPredicate) -> [ModelType]
    func loadAll() -> [ModelType]
    
    func delete(id: String)
    func delete(uuid: UUID)
    func deleteItemsWithPredicate(predicate: NSPredicate)
    func deleteAll()
}
