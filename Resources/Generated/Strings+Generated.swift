// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Alerts {
    /// Error
    public static let errorTitle = L10n.tr("Localizable", "alerts.error-title")
    /// OK
    public static let ok = L10n.tr("Localizable", "alerts.ok")
    /// Something went wrong
    public static let somethingWentWrong = L10n.tr("Localizable", "alerts.something-went-wrong")
  }

  public enum CityList {
    /// No cities selected. Choose city by pressing plus button
    public static let noCitiesSelected = L10n.tr("Localizable", "cityList.no-cities-selected")
    /// Watching cities
    public static let watchingCities = L10n.tr("Localizable", "cityList.watching-cities")
  }

  public enum CitySearch {
    /// City name
    public static let cityName = L10n.tr("Localizable", "citySearch.city-name")
    /// Search city
    public static let searchCity = L10n.tr("Localizable", "citySearch.search-city")
  }

  public enum Common {
    /// %s °C
    public static func celsius(_ p1: UnsafePointer<CChar>) -> String {
      return L10n.tr("Localizable", "common.celsius", p1)
    }
    /// %s km
    public static func km(_ p1: UnsafePointer<CChar>) -> String {
      return L10n.tr("Localizable", "common.km", p1)
    }
    /// %s m/s
    public static func metrPerSecond(_ p1: UnsafePointer<CChar>) -> String {
      return L10n.tr("Localizable", "common.metr-per-second", p1)
    }
    /// %s mmHg
    public static func mmHg(_ p1: UnsafePointer<CChar>) -> String {
      return L10n.tr("Localizable", "common.mmHg", p1)
    }
  }

  public enum Keyboard {
    /// Ready
    public static let ready = L10n.tr("Localizable", "keyboard.ready")
  }

  public enum Navigation {
    /// Back
    public static let back = L10n.tr("Localizable", "navigation.back")
  }

  public enum SearchBar {
    /// Cancel
    public static let cancel = L10n.tr("Localizable", "searchBar.cancel")
  }

  public enum WeatherDetail {
    /// Daily forecast
    public static let dailyForecast = L10n.tr("Localizable", "weatherDetail.daily-forecast")
    /// Feels like
    public static let feelsLike = L10n.tr("Localizable", "weatherDetail.feels-like")
    /// Pressure
    public static let pressure = L10n.tr("Localizable", "weatherDetail.pressure")
    /// Visability
    public static let visability = L10n.tr("Localizable", "weatherDetail.visability")
    /// Weather conditions
    public static let weatherConditions = L10n.tr("Localizable", "weatherDetail.weather-conditions")
    /// Wind
    public static let wind = L10n.tr("Localizable", "weatherDetail.wind")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
