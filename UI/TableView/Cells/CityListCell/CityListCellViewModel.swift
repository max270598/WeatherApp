//
//  CityListViewModel.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import UIKit
import Core

public class CityListCellViewModel: ICellIdentifiable {
    
    public var cellIdentifier: String = String(describing: CityListCell.self)
    
    let cityName: String
    let imageUrl: URL?
    let temp: String
    
    public init(cityName: String, imageUrl: URL?, temp: String){
        self.cityName = cityName
        self.imageUrl = imageUrl
        self.temp = temp
    }
}
