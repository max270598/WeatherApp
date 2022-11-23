//
//  SeparatorView.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit
import Resources

public class SeparatorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .black//Assets.Colors.separator.color
    }
}
