//
//  Weather.swift
//  Domain
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public struct Weather: Codable {
    public let dt: Double
    public let weatherInfo: WeatherInfo
    public let weatherDetail: [WeatherDetail]
    public let clouds: Clouds
    public let wind: Wind
    public let visibility: Int
    public let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case weatherInfo = "main"
        case weatherDetail = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case dtTxt = "dt_txt"
    }
}
