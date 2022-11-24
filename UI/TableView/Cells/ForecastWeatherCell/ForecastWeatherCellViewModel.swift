//
//  ForecastWeatherCellViewModel.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation

public class ForecastWeatherCellViewModel: ICellIdentifiable {
    
    public var cellIdentifier: String = String(describing: ForecastWeatherCell.self)
    
    let dayAndTime: String
    let imageUrl: URL?
    let temp: String
    
    public init(dayAndTime: String, imageUrl: URL?, temp: String){
        self.dayAndTime = dayAndTime
        self.imageUrl = imageUrl
        self.temp = temp
    }
}
