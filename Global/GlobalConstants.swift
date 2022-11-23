//
//  Global.swift
//  Global
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public enum GlobalConstants {
    
    public enum OpenWeatherApi {
        public static let appid = "1361df7225fe44ea1c924175b4ce687c"
    }
    
    public enum OpenWeatherIconUrls {
        public static func iconUrl(iconName: String) -> URL? {
            return URL(string: "http://openweathermap.org/img/wn/\(iconName)@2x.png")
        }
    }
    
}
