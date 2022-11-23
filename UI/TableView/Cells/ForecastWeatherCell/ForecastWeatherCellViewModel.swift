//
//  ForecastWeatherCellViewModel.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation

public class ForecastWeatherCellViewModel: ICellIdentifiable {
    
    public var cellIdentifier: String = String(describing: ForecastWeatherCell.self)
    
    let dayName: String
    let imageUrl: URL?
    let maxTemp: String
    let minTemp: String
    
    public init(dayName: String, imageUrl: URL?, maxTemp: String, minTemp: String){
        self.dayName = dayName
        self.imageUrl = imageUrl
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }
}
