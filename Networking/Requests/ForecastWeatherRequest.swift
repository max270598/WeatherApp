//
//  DailyWeatherRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Global

public struct ForecastWeatherRequest: IRequest {
    
    // MARK: - Properties
    
    private let latitude: Double
    private let longitude: Double
    
    // MARK: - Initialization
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // MARK: - IRequest
    
    public var path: String {
        return "/forecast"
    }
    
    public var parameters: [String: Encodable]? {
        return [
            "lat": latitude,
            "lon": longitude,
            "appid": GlobalConstants.OpenWeatherApi.appid
        ]
    }
}
