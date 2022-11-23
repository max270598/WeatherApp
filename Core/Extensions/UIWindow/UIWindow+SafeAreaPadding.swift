//
//  UIWindow+SafeAreaPadding.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit

extension UIWindow {
    
    public static var topSafeAreaPadding: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
    
    public static var bottomSafeAreaPadding: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }
}
