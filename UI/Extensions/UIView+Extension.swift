//
//  UIView+Extension.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit
import SnapKit

public extension UIView {
    
    func pinToEdges() {
        if superview == nil {
            assertionFailure("Отсутствует superview")
            return
        }
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
