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

public class CityListViewModel {
    
    // MARK: - Dependencies
    
    let networkClient: INetworkClient = NetworkClient()
    
    // MARK: - Properties
    
    var sections: Dynamic<[ISectionRowsRepresentable]> = Dynamic<[ISectionRowsRepresentable]>([])
    var error: Dynamic<NetworkRequestError?> = Dynamic<NetworkRequestError?>(nil)
    var cities: [CityModel] = []
    
    // MARK: - Initializer
    
    public init() {}
    
    // MARK: - ICityListViewModel
    
    func viewDidLoad() {
        createCity()
        loadSectionsFromDB()
        fetchWeather()
    }
    
    func removeRow(indexPath: IndexPath) {
        let service = ChosenCitiesStorageService()
        service.removeCity(city: cities[indexPath.row])
        cities.remove(at: indexPath.row)
        sections.value[indexPath.section].rowViewModels.remove(at: indexPath.row)
    }
    
    // MARK: - Networking
    
    private func fetchWeather() {
        let group = DispatchGroup()
        
        for i in 0..<cities.count {
            group.enter()
            let request = CurrentWeatherRequest(latitude: cities[i].latitude, longitude: cities[i].longitude)
            networkClient.send(request) { [weak self] (result: Result<Weather, NetworkRequestError>) in
                if case let .success(weather) = result {
                    self?.cities[i].currentWeather = WeatherModel(dto: weather)
                    group.leave()
                }
                if case let .failure(error) = result {
                    self?.error.value = error
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            DispatchQueue.main.async {
                self?.buildSections()
            }
        }
    }
    
    // MARK: - Private
    
    private func createCity() {
        let city1 = CityModel(id: "0", name: "Moscow", latitude: 55.755864, longitude: 37.617698, currentWeather: nil, weekWeather: [])
//        let city2 = CityModel(id: "1", name: "Saint-Petersburg", latitude: 59.938955, longitude: 30.315644, currentWeather: nil, weekWeather: [])
//        let city3 = CityModel(id: "2", name: "Limasol", latitude: 34.687014, longitude: 33.036281, currentWeather: nil, weekWeather: [])
        
        let service = ChosenCitiesStorageService()
        service.saveCity(city: city1)
//        service.saveCity(city: city2)
//        service.saveCity(city: city3)
    }
    
    private func loadSectionsFromDB() {
        self.cities = ChosenCitiesStorageService().getCities()
    }
    
    private func buildSections() {
        let citySection = createChosenCitySections()
        sections.value.append(citySection)
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

