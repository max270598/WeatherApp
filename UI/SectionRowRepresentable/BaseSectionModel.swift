//
//  BaseSectionViewModel.swift
//  UI
//
//  Created by Мах Ol on 20.11.2022.
//

import Foundation

public class BaseSectionViewModel: ISectionRowsRepresentable {
        
    // MARK: - ISectionRowsRepresentable
    
   public var rowViewModels: [ICellIdentifiable]
   public var headerViewModel: IHeaderFooterViewIdentifiable?
    
    // MARK: - Initialization
    
    public init(rowViewModels: [ICellIdentifiable], headerViewModel: IHeaderFooterViewIdentifiable?) {
        self.rowViewModels = rowViewModels
        self.headerViewModel = headerViewModel
    }
}
