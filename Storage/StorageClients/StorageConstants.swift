//
//  StorageConstants.swift
//  Storage
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import RealmSwift

public enum StorageConstants {
    public enum Realm {
        static let inMemoryIdentifier = "com.weatherapp.weatherapp"
        static let schemaVersion: UInt64 = 1
        static let deleteAllExclude: [RealmSwift.Object.Type] = []
    }
}
