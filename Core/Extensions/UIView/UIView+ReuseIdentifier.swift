//
//  UIView+ReuseIdentifier.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit

public protocol ReuseIdentifiable {
    static var reuseIdentifer: String { get }
}

extension UIView: ReuseIdentifiable {
    
    public static var reuseIdentifer: String {
        return String(describing: self)
    }
}
