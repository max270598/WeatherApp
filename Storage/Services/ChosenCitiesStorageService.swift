//
//  ChosenCitiesStorageService.swift
//  Storage
//
//  Created by Мах Ol on 20.11.2022.
//

import Foundation
import Models

protocol IChosenCitiesStorageService {
    func saveCity(city: CityModel)
    func getCities() -> [CityModel]
    func removeCity(city: CityModel)
}

public final class ChosenCitiesStorageService: IChosenCitiesStorageService {
    
    private let storageClient = RealmStorageClient<CityModel>(inMemory: false)
    
    public init() {}
    
    public func saveCity(city: CityModel) {
        storageClient.save(value: city)
    }
    
    public func getCities() -> [CityModel] {
        let chosenCities = storageClient.loadAll()
        return chosenCities
    }
    
    public func removeCity(city: CityModel) {
        storageClient.delete(id: city.id)
    }
}
