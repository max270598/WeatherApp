//
//  TitleCellViewModel.swift
//  UI
//
//  Created by Мах Ol on 24.11.2022.
//

import Foundation


public class TitleCellViewModel: ICellIdentifiable {
    
    public var cellIdentifier: String = String(describing: TitleCell.self)
    
    let title: String
    
    public init(title: String) {
        self.title = title
    }
}
