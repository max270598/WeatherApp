//
//  DailyCurrentWeatherResponce.swift
//  Domain
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public struct DailyWeatherResponce: Codable {
    public let cod: String?
    public let message: Int?
    public let cnt: Int?
    public let list: [Weather]
}






