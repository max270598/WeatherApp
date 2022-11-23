//
//  CityModel.swift
//  Models
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Domain


public struct CityModel {
    public let id: String
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public var currentWeather: WeatherModel?
    public var weekWeather: [WeatherModel]
    
    public init(id: String, name: String, latitude: Double, longitude: Double, currentWeather: WeatherModel?, weekWeather: [WeatherModel]) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.currentWeather = currentWeather
        self.weekWeather = weekWeather
    }
    
}
