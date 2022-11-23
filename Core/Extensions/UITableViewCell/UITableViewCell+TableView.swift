//
//  UITableViewCell+TableView.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit

public extension UITableViewCell {
    
    var tableView: UITableView? {
        var view = superview
        while let v = view, v.isKind(of: UITableView.self) == false {
            view = v.superview
        }
        return view as? UITableView
    }
}
