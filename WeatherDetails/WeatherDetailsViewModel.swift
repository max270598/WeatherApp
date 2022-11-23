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
    
    let networkClient: INetworkClient = NetworkClient()
    
    // MARK: - Properties
    
    var sections: Dynamic<[ISectionRowsRepresentable]> = Dynamic<[ISectionRowsRepresentable]>([])
    var error: Dynamic<NetworkRequestError?> = Dynamic<NetworkRequestError?>(nil)
    var city: CityModel
    
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
                self?.city.weekWeather = response.list.map { WeatherModel(dto: $0) }
                self?.buildSections()
            }
            if case let .failure(error) = result {
                self?.error.value = error
            }
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
    }
    
    private func createHeadlineSection() -> BaseSectionViewModel {
        let rowVM: ICellIdentifiable = WeatherDetailHeadlineViewModel(cityName: city.name, temp: String(city.currentWeather?.weatherInfo.temp), description: city.currentWeather?.weatherDetail.first?.weatherDescription)
        
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
                                                          title: L10n.Common.miles(visability))
        
        rowVMs.append(feelLikeCellVM)
        rowVMs.append(pressureCellVM)
        rowVMs.append(windCellVM)
        rowVMs.append(visabilityCellVM)

        let headerVM = TitleSectionHeaderViewModel(title: L10n.WeatherDetail.weatherConditions)
        let sectionVM = BaseSectionViewModel(rowViewModels: rowVMs, headerViewModel: headerVM)
        return sectionVM
    }
    
    private func createForecastWeatherCellVM(weather: WeatherModel) -> ForecastWeatherCellViewModel {
        let dayName = Date.dayOfWeek(timestamp: weather.dt)
        let icon = weather.weatherDetail.first?.icon
        let maxTemp = String(weather.weatherInfo.tempMax)
        let minTemp = String(weather.weatherInfo.tempMin)
        let cellVM = ForecastWeatherCellViewModel (
            dayName: dayName,
            imageUrl: GlobalConstants.OpenWeatherIconUrls.iconUrl(iconName: icon ?? ""),
            maxTemp: L10n.Common.celsius(maxTemp),
            minTemp: L10n.Common.celsius(minTemp)
        )
        return cellVM
    }
    
    private func createSubTitleTitleCellVM(subTitle: String, title: String) -> SubTitleTitleCellViewModel {
        let cellVM = SubTitleTitleCellViewModel(subTitle: subTitle, title: title)
        return cellVM
    }
    
}

