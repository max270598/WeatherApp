//
//  RealmStorageClient.swift
//  Storage
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import RealmSwift

public final class RealmStorageClient<T: IRealmRepresentable>: IStorageClient
where T == T.RealmType.ModelType, T.RealmType: Object {
    
    let inMemory: Bool
    
    public init(inMemory: Bool = false) {
        self.inMemory = inMemory
    }
    
    private var realm: Realm? {
        guard inMemory else {
            var configuration = Realm.Configuration.defaultConfiguration
            configuration.schemaVersion = StorageConstants.Realm.schemaVersion
            return try? Realm(configuration: configuration)
        }
        let identifier = StorageConstants.Realm.inMemoryIdentifier
        return try? Realm(configuration: Realm.Configuration(inMemoryIdentifier: identifier))
    }

    public func save(values: [T]) {
        guard let realm = realm else { return }
        try? realm.write {
            values.forEach {
                realm.add($0.asRealm(), update: .all)
            }
        }
    }

    public func save(value: T) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(value.asRealm(), update: .all)
        }
    }

    public func load(id: String?) -> T? {
        guard let realm = realm else { return nil }
        let object: T.RealmType?
        if let id = id {
            object = realm.object(ofType: T.RealmType.self, forPrimaryKey: id)
        } else {
            object = realm.objects(T.RealmType.self).first
        }
        return object.map { $0.asModel() }
    }
    
    public func load(uuid: UUID?) -> T? {
        guard let realm = realm else { return nil }
        let object: T.RealmType?
        if let uuid = uuid {
            object = realm.object(ofType: T.RealmType.self, forPrimaryKey: uuid)
        } else {
            object = realm.objects(T.RealmType.self).first
        }
        return object.map { $0.asModel() }
    }
    
    public func loadWithPredicate(predicate: NSPredicate) -> [T] {
        guard let realm = realm else { return [] }
        let objects = realm.objects(T.RealmType.self).filter(predicate)
        return objects.map { $0.asModel() }
    }

    public func loadAll() -> [T] {
        guard let realm = realm else { return [] }
        let objects = realm.objects(T.RealmType.self)
        return objects.map { $0.asModel() }
    }

    public func delete(id: String) {
        guard let realm = realm else { return }
        guard let object = realm.object(ofType: T.RealmType.self, forPrimaryKey: id) else { return }
        try? realm.write {
            realm.delete(object)
        }
    }
    
    public func delete(uuid: UUID) {
        guard let realm = realm else { return }
        guard let object = realm.object(ofType: T.RealmType.self, forPrimaryKey: uuid) else { return }
        try? realm.write {
            realm.delete(object)
        }
    }
    
    public func deleteItemsWithPredicate(predicate: NSPredicate) {
        guard let realm = realm else { return }
        let objects = realm.objects(T.RealmType.self).filter(predicate)
        try? realm.write {
            realm.delete(objects)
        }
    }
    
    public func deleteAll() {
        guard let realm = realm else { return }
        try? realm.write {
            realm.delete(realm.objects(T.RealmType.self))
        }
    }
}
