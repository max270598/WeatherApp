//
//  WeatherDetail.swift
//  Domain
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public struct WeatherDetail: Codable {
    public let id: Int
    public let main: String
    public let weatherDescription: String
    public let icon: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }
}
