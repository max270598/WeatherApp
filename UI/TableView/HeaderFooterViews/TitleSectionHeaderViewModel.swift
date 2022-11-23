//
//  TitleSectionHeaderViewModel.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation
import UIKit

public class TitleSectionHeaderViewModel: IHeaderFooterViewIdentifiable {
    
    // MARK: - Properties
    
    public let title: String
    public let sectionIndex: Int?
    public let headerFooterIdentifier: String = String(describing: TitleSectionHeaderView.self)
    
    // MARK: - Initialization
    
    public init(title: String, sectionIndex: Int? = nil) {
        self.title = title
        self.sectionIndex = sectionIndex
    }
}
