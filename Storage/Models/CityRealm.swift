//
//  CityRealm.swift
//  Storage
//
//  Created by Мах Ol on 20.11.2022.
//

import Foundation
import Models
import RealmSwift

// MARK: - Realm

public final class CityRealm: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}

extension CityRealm: IModelConvertible {
    
    public func asModel() -> CityModel {
        return CityModel(name: name,
                         latitude: latitude,
                         longitude: longitude,
                         currentWeather: nil,
                         weekWeather: [])
    }
}

extension CityModel: IRealmRepresentable {
    
    public func asRealm() -> CityRealm {
        let object = CityRealm()
        object.name = name
        object.latitude = latitude
        object.longitude = longitude
        return object
    }
}
