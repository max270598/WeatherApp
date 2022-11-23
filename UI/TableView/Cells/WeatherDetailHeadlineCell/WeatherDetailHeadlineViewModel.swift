//
//  WeatherDetailHeadlineViewModel.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation

public class WeatherDetailHeadlineViewModel: ICellIdentifiable {
    
    public var cellIdentifier: String = String(describing: WeatherDetailHeadlineCell.self)
    
    let cityName: String
    let temp: String
    let description: String?
    
    public init(cityName: String, temp: String, description: String?) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
    }
}
