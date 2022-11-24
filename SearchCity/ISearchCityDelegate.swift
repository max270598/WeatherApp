//
//  ISearchCityDelegate.swift
//  SearchCity
//
//  Created by Мах Ol on 24.11.2022.
//

import Foundation
import Models

public protocol ISearchCityDelegate: AnyObject {
    func didSelectCity(city: CityModel)
}
