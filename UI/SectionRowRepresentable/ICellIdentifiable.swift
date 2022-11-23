//
//  TableViewRawRepresentable.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import UIKit

public protocol ICellIdentifiable {
    var cellIdentifier: String { get }
}

public protocol IBaseCell {
    func configure(with viewModel: ICellIdentifiable?)
}

open class BaseTableViewCell: UITableViewCell, IBaseCell {
        
    open func configure(with viewModel: ICellIdentifiable?) {
        selectionStyle = .none
    }
}

open class BaseCollectionViewCell: UICollectionViewCell, IBaseCell {

    open func configure(with viewModel: ICellIdentifiable?) {
    }
}
