//
//  UITableView+Extension.swift
//  UI
//
//  Created by Мах Ol on 24.11.2022.
//

import Foundation
import UIKit
import Resources

public extension UITableView {
    
    func isCellVisible(section:Int, row: Int) -> Bool {
        guard let indexes = self.indexPathsForVisibleRows else {
            return false
        }
        return indexes.contains {$0.section == section && $0.row == row }
    }
    
}

