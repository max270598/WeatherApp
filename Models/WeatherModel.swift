//
//  WeatherModel.swift
//  Models
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Domain

public struct WeatherModel {
    public let dt: Double
    public let weatherInfo: WeatherInfoModel
    public let weatherDetail: [WeatherDetailModel]
    public let clouds: CloudsModel
    public let wind: WindModel
    public let visibility: Int
    public let dtTxt: String?

    
    public init(dt: Double, weatherInfo: WeatherInfoModel, weatherDetail: [WeatherDetailModel], clouds: CloudsModel, wind: WindModel, visibility: Int, dtTxt: String?) {
        self.dt = dt
        self.weatherInfo = weatherInfo
        self.weatherDetail = weatherDetail
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.dtTxt = dtTxt
    }
    
    public init(dto: Weather) {
        self.dt = dto.dt
        self.weatherInfo = .init(dto: dto.weatherInfo)
        self.weatherDetail = dto.weatherDetail.map { WeatherDetailModel(dto: $0) }
        self.clouds = .init(dto: dto.clouds)
        self.wind = .init(dto: dto.wind)
        self.visibility = dto.visibility / 1000
        self.dtTxt = dto.dtTxt
    }
}

