//
//  ChooseCityViewMode.swift
//  ChooseCity
//
//  Created by Мах Ol on 24.11.2022.
//

import Foundation
import UI
import Core
import Models
import Storage
import CoreLocation

public class SearchCityViewModel {
    
    // MARK: - Dependencies
    
    private let locationManager = CLLocationManager()
    weak private var delegate: ISearchCityDelegate?
    
    // MARK: - Properties
    
    var sections: Dynamic<[ISectionRowsRepresentable]> = Dynamic<[ISectionRowsRepresentable]>([])
    var error: Dynamic<Error>?
    var placemarks: [CLPlacemark] = []
    
    // MARK: - Initializer
    
    public init(delegate: ISearchCityDelegate?) {
        self.delegate = delegate
    }
        
    // MARK: - Actions
    
    func didSelectRow(indexPath: IndexPath) {
        let placemark = placemarks[indexPath.row]
        guard let name = placemark.name,
              let latitude = placemark.location?.coordinate.latitude,
              let longitude = placemark.location?.coordinate.longitude else { return }
        let city = CityModel(name: name, latitude: latitude, longitude: longitude, currentWeather: nil, weekWeather: [])
        delegate?.didSelectCity(city: city)
    }
    
    func fetchLocation(forPlaceCalled name: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(name, in: nil, preferredLocale: Locale.init(identifier: "en_US")) {
            [weak self] placemarks, error in
               if let placemarks = placemarks {
                   self?.placemarks = placemarks
               } else {
                   self?.placemarks = []
               }
                self?.buildSections()

               if let error = error {
                   self?.error?.value = error
               }
           }
       }
    
    // MARK: - Private
    
    private func buildSections() {
        let placemarksSection = createPlacemarksSection()
        sections.value = [placemarksSection]
    }
    
    private func createPlacemarksSection() -> BaseSectionViewModel {
        let rows: [TitleCellViewModel] = placemarks.compactMap {
            guard let name = $0.name else { return nil }
            return TitleCellViewModel(title: name)
        }
        let section = BaseSectionViewModel(rowViewModels: rows, headerViewModel: nil)
        return section
    }
}

