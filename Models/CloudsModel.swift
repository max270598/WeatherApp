//
//  CloudsModel.swift
//  Models
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import Domain

public struct CloudsModel {
    public let all: Int?

    public init(all: Int?) {
        self.all = all
    }
    
    public init(dto: Clouds) {
        self.all = dto.all
    }
}
