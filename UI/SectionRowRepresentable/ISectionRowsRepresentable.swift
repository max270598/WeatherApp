//
//  SectionRowRepresentableType.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public protocol ISectionRowsRepresentable {
    var rowViewModels: [ICellIdentifiable] { get set }
    var headerViewModel: IHeaderFooterViewIdentifiable? { get set }
}
