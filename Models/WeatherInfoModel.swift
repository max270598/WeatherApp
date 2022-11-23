//
//  WeatherInfoModel.swift
//  Models
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Domain

public struct WeatherInfoModel {
    public let temp: Int
    public let feelsLike: Int
    public let tempMin: Int
    public let tempMax: Int
    public let pressure: Int?
    public let seaLevel: Int?
    public let grndLevel: Int?
    public let humidity: Int?
    public let tempKf: Int?

    public init(temp: Int, feelsLike: Int, tempMin: Int, tempMax: Int, pressure: Int?, seaLevel: Int?, grndLevel: Int?, humidity: Int?, tempKf: Int?) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.tempKf = tempKf
    }
    
    public init(dto: WeatherInfo) {
        self.temp = Int(dto.temp - 273.15)
        self.feelsLike = Int(dto.feelsLike - 273.15)
        self.tempMin = Int(dto.tempMin - 273.15)
        self.tempMax = Int(dto.tempMax - 273.15)
        self.pressure = dto.pressure
        self.seaLevel = dto.seaLevel
        self.grndLevel = dto.grndLevel
        self.humidity = dto.humidity
        self.tempKf = dto.tempKf.map{ Int($0 - 273.15) }
    }
}
