//
//  WindModel.swift
//  Models
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Domain

public struct WindModel {
    public let speed: Double?
    public let deg: Int?
    public let gust: Double?

    public init(speed: Double?, deg: Int?, gust: Double?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
    
    public init(dto: Wind) {
        self.speed = dto.speed
        self.deg = dto.deg
        self.gust = dto.gust
    }
}
