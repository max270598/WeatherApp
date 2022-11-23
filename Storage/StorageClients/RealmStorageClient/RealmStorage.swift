//
//  RealmStorage.swift
//  Storage
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import RealmSwift

public struct RealmStorage: IStorage {
    public func clear() {
        do {
            var configuration = Realm.Configuration.defaultConfiguration
            configuration.schemaVersion = StorageConstants.Realm.schemaVersion
            let realm = try Realm(configuration: configuration)
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print("REALM: - error = \(error.description)")
        }

        do {
            let inMemoryRealm = try Realm(configuration:
                Realm.Configuration(inMemoryIdentifier: StorageConstants.Realm.inMemoryIdentifier))
            try inMemoryRealm.write {
                inMemoryRealm.deleteAll()
            }
        } catch let error as NSError {
            print("REALM: - In memory error = \(error.description)")
        }
    }
}
