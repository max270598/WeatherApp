//
//  HeaderFooterViewIdentifiableType.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import UIKit

public protocol IHeaderFooterViewIdentifiable {
    var sectionIndex: Int? { get }
    var headerFooterIdentifier: String { get }
}

public protocol IBaseHeaderFooterView {
    func configure(with viewModel: IHeaderFooterViewIdentifiable?)
}

open class BaseHeaderFooterView: UITableViewHeaderFooterView, IBaseHeaderFooterView {
    
    open func configure(with viewModel: IHeaderFooterViewIdentifiable?) {}
}
