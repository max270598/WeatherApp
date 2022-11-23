//
//  UISearchBar+TextField.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit

public extension UISearchBar {

    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            // Fallback on earlier versions
            for view: UIView in (self.subviews[0]).subviews {
                if let textField = view as? UITextField {
                    return textField
                }
            }
        }
        return nil
    }
}
