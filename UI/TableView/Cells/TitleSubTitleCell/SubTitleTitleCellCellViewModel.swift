//
//  SubTitleTitleCellViewModel.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation

public class SubTitleTitleCellViewModel: ICellIdentifiable {
    
    public var cellIdentifier: String = String(describing: SubTitleTitleCell.self)
    
    let subTitle: String
    let title: String
    
    public init(subTitle: String, title: String) {
        self.subTitle = title
        self.title = subTitle
    }
}
