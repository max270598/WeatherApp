//
//  Configuration.swift
//  UniqueSDK
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

enum ConfigKey: String {
    case environment = "Environment"
}

public final class Configuration {
    
    public static let shared = Configuration()
    
    private init() {}
    
    let environment: Environment = {
        return .dev
    }()

    func apiUrl() -> URL {
        switch self.environment {
        case .local:
            return URL(string: "")!
        case .dev:
            return URL(string: "https://api.openweathermap.org/data")!
        case .prod:
            return URL(string: "")!
        }
    }
}

private enum PlistConfiguration {
    
    static func valueForKey<Value>(_ key: ConfigKey, default: Value) -> Value {
        return valueForKey(key) ?? `default`
    }
    
    private static func valueForKey<Value>(_ key: ConfigKey) -> Value? {
        return Bundle.main.infoDictionary?[key.rawValue] as? Value
    }
}
