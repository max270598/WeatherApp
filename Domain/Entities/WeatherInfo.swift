//
//  WeatherInfo.swift
//  Domain
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public struct WeatherInfo: Codable {
    public let temp: Double
    public let feelsLike: Double
    public let tempMin: Double
    public let tempMax: Double
    public let pressure: Int?
    public let seaLevel: Int?
    public let grndLevel: Int?
    public let humidity: Int?
    public let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity = "humidity"
        case tempKf = "temp_kf"
    }
}
