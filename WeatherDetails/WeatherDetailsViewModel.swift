//
//  WeatherDetailsViewModel.swift
//  WeatherDetails
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation
import Models
import UI
import Networking
import Domain
import Core
import Global
import Resources

public class WeatherDetailsViewModel {
    
    // MARK: - Dependencies
    
    private let networkClient: INetworkClient = NetworkClient()
    
    // MARK: - Properties
    
    var sections: Dynamic<[ISectionRowsRepresentable]> = Dynamic<[ISectionRowsRepresentable]>([])
    var error: Dynamic<NetworkRequestError>?
    var navigationTitle: Dynamic<String?> = Dynamic<String?>(nil)
    var city: CityModel
    private var isFirstLoad: Bool = true
    
    // MARK: - Initialize
    
    public init(city: CityModel) {
        self.city = city
    }
    // MARK: - ICityListViewModel
    
    func viewDidLoad() {
        fetchWeather()
    }
    
    // MARK: - Networking
    
    private func fetchWeather() {
        
        let request = ForecastWeatherRequest(latitude: city.latitude, longitude: city.longitude)
        
        networkClient.send(request) { [weak self] (result: Result<DailyWeatherResponce, NetworkRequestError>) in
            if case let .success(response) = result {
                DispatchQueue.main.async {
                    self?.city.weekWeather = response.list.map { WeatherModel(dto: $0) }
                    self?.buildSections()
                }
            }
            if case let .failure(error) = result {
                self?.error?.value = error
            }
        }
    }
    
    // MARK: - Actions
    
    func headLineRowIsVisible(isVisible: Bool) {
        guard !isFirstLoad else { return }
        if isVisible {
            navigationTitle.value = nil
        } else {
            let cityName = city.name
            let temp = String(city.currentWeather?.weatherInfo.temp)
            let str = "\(cityName), \(L10n.Common.celsius(temp))"
            navigationTitle.value = str
        }
    }
    
    // MARK: - Private
    
    private func buildSections() {
        var sectionVMs: [ISectionRowsRepresentable] = []
        
        let headlineSectionVM = createHeadlineSection()
        let forecastSectionVM = createForecastWeatherSection()
        let conditionSectionVM = createWeatherConditionsSection()
        
        sectionVMs.append(headlineSectionVM)
        sectionVMs.append(forecastSectionVM)
        sectionVMs.append(conditionSectionVM)
        
        sections.value = sectionVMs
        isFirstLoad = false
    }
    
    private func createHeadlineSection() -> BaseSectionViewModel {
        
        let temp = String(city.currentWeather?.weatherInfo.temp)
        let rowVM = WeatherDetailHeadlineViewModel(
            cityName: city.name,
            temp: L10n.Common.celsius(temp),
            description: city.currentWeather?.weatherDetail.first?.weatherDescription
        )
        
        let sectionVM = BaseSectionViewModel(rowViewModels: [rowVM], headerViewModel: nil)
        return sectionVM
    }
    
    private func createForecastWeatherSection() -> ISectionRowsRepresentable {
        let rowVMs: [ICellIdentifiable] = city.weekWeather.map {
            return createForecastWeatherCellVM(weather: $0)
        }
        let headerVM = TitleSectionHeaderViewModel(title: L10n.WeatherDetail.dailyForecast)
        let sectionVM = BaseSectionViewModel(rowViewModels: rowVMs, headerViewModel: headerVM)
        return sectionVM
    }
    
    private func createWeatherConditionsSection() -> ISectionRowsRepresentable {
        var rowVMs: [ICellIdentifiable] = []
        
        let feelsLikeTemp = String(city.currentWeather?.weatherInfo.feelsLike)
        let feelLikeCellVM = SubTitleTitleCellViewModel(subTitle: L10n.WeatherDetail.feelsLike,
                                                        title: L10n.Common.celsius(feelsLikeTemp))
        
        let pressure = String(city.currentWeather?.weatherInfo.pressure)
        let pressureCellVM = SubTitleTitleCellViewModel(subTitle: L10n.WeatherDetail.pressure,
                                                        title: L10n.Common.mmHg(pressure))
        
        let wind = String(city.currentWeather?.wind.speed)
        let windCellVM = SubTitleTitleCellViewModel(subTitle: L10n.WeatherDetail.wind,
                                                    title: L10n.Common.metrPerSecond(wind))
        
        let visability = String(city.currentWeather?.visibility)
        let visabilityCellVM = SubTitleTitleCellViewModel(subTitle: L10n.WeatherDetail.visability,
                                                          title: L10n.Common.km(visability))
        
        rowVMs.append(feelLikeCellVM)
        rowVMs.append(pressureCellVM)
        rowVMs.append(windCellVM)
        rowVMs.append(visabilityCellVM)

        let headerVM = TitleSectionHeaderViewModel(title: L10n.WeatherDetail.weatherConditions)
        let sectionVM = BaseSectionViewModel(rowViewModels: rowVMs, headerViewModel: headerVM)
        return sectionVM
    }
    
    private func createForecastWeatherCellVM(weather: WeatherModel) -> ForecastWeatherCellViewModel {
        let dayAndTime = Date.dayAndTime(timestamp: weather.dt)
        let icon = weather.weatherDetail.first?.icon
        let temp = String(weather.weatherInfo.temp)
        let cellVM = ForecastWeatherCellViewModel (
            dayAndTime: dayAndTime,
            imageUrl: GlobalConstants.OpenWeatherIconUrls.iconUrl(iconName: icon ?? ""),
            temp: L10n.Common.celsius(temp)
        )
        return cellVM
    }
    
    private func createSubTitleTitleCellVM(subTitle: String, title: String) -> SubTitleTitleCellViewModel {
        let cellVM = SubTitleTitleCellViewModel(subTitle: subTitle, title: title)
        return cellVM
    }
}
