//
//  WeatherDetailModel.swift
//  Models
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Domain

public struct WeatherDetailModel {
    public let id: Int
    public let main: String
    public let weatherDescription: String
    public let icon: String

    public init(id: Int, main: String, weatherDescription: String, icon: String) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
    
    public init(dto: WeatherDetail) {
        self.id = dto.id
        self.main = dto.main
        self.weatherDescription = dto.weatherDescription
        self.icon = dto.icon
    }

}
