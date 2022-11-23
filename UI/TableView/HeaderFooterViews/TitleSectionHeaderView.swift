//
//  TitleHeaderFooterView.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation
import UIKit
import Resources

private enum Constants {
    static let titleLabelLeftRight: CGFloat = 20
    static let titleLabelTopBottom: CGFloat = 15
}

final public class TitleSectionHeaderView: BaseHeaderFooterView {

    // MARK: - Subviews
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = Assets.Colors.textPrimary.color
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    

    
    // MARK: - Initialization

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupConstraints()
    }

    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
    }
    
    // MARK: - Subviews Constraints
    
    private func setupConstraints() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(Constants.titleLabelLeftRight)
            $0.top.bottom.equalToSuperview().inset(Constants.titleLabelTopBottom)
        }
    }
    
    // MARK: - Configuration
    
    public override func configure(with viewModel: IHeaderFooterViewIdentifiable?) {
        guard let viewModel = viewModel as? TitleSectionHeaderViewModel else {
            return
        }
        titleLabel.text = viewModel.title
    }
}
