//
//  CityListViewModel.swift
//  CityList
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import UI
import Core
import Models
import Storage
import Networking
import Domain
import Resources
import Global
import SearchCity
import UIKit
import WeatherDetails
import SearchCity

public class CityListViewModel {
    
    // MARK: - Dependencies
    
    private let networkClient: INetworkClient = NetworkClient()
    private let storageService = ChosenCitiesStorageService()
    
    // MARK: - Properties
    
    var sections: Dynamic<[ISectionRowsRepresentable]> = Dynamic<[ISectionRowsRepresentable]>([])
    var error: Dynamic<NetworkRequestError>?
    var cities: [CityModel] = []
    
    // MARK: - Initializer
    
    public init() {}
    
    // MARK: - Actions
    
    func viewDidLoad() {
        loadSectionsFromDB()
        fetchWeather()
    }
    
    func removeRow(indexPath: IndexPath) {
        storageService.removeCity(city: cities[indexPath.row])
        cities.remove(at: indexPath.row)
        sections.value[indexPath.section].rowViewModels.remove(at: indexPath.row)
    }
    
    func prepareController(route: CityListRoute) -> UIViewController {
        switch route {
        case .search:
            let searchVC = SearchCityViewController()
            let searchVM = SearchCityViewModel(delegate: self)
            searchVC.viewModel = searchVM
            return searchVC
        case .details(let indexPath):
            let city = cities[indexPath.row]
            let weatherDetailsVM = WeatherDetailsViewModel(city: city)
            let weatherDetailsVC = WeatherDetailsViewController()
            weatherDetailsVC.viewModel = weatherDetailsVM
            return weatherDetailsVC
        }
    }
    
    // MARK: - Networking
    
    private func fetchWeather() {
        let group = DispatchGroup()
        for i in 0..<cities.count {
            group.enter()
            let request = CurrentWeatherRequest(latitude: cities[i].latitude, longitude: cities[i].longitude)
            networkClient.send(request) { [weak self] (result: Result<Weather, NetworkRequestError>) in
                if case let .success(weather) = result {
                    DispatchQueue.main.async {
                        self?.cities[i].currentWeather = WeatherModel(dto: weather)
                        group.leave()
                    }
                }
                if case let .failure(error) = result {
                    DispatchQueue.main.async {
                        self?.error?.value = error
                        group.leave()
                    }
                }
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            DispatchQueue.main.async {
                self?.updateSections()
            }
        }
    }
    
    // MARK: - Private
    
    private func loadSectionsFromDB() {
        self.cities = ChosenCitiesStorageService().getCities()
    }
    
    private func updateSections() {
        let citySection = createChosenCitySections()
        sections.value = [citySection]
    }
    
    private func createChosenCitySections() -> BaseSectionViewModel {
        let rows: [CityListCellViewModel] = cities.map {
            let icon = $0.currentWeather?.weatherDetail.first?.icon
            let temp = String($0.currentWeather?.weatherInfo.temp)
            return CityListCellViewModel(
                cityName: $0.name,
                imageUrl: GlobalConstants.OpenWeatherIconUrls.iconUrl(iconName: icon ?? ""),
                temp: L10n.Common.celsius(temp)
            )
        }
        let section = BaseSectionViewModel(rowViewModels: rows, headerViewModel: nil)
        return section
    }
    
}

// MARK: - ISearchCityDelegate

extension CityListViewModel: ISearchCityDelegate {
    
    public func didSelectCity(city: CityModel) {
        guard !cities.contains(city) else { return }
        cities.append(city)
        fetchWeather()
        storageService.saveCity(city: city)
        updateSections()
    }
}
