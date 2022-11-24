//
//  TitleCell.swift
//  UI
//
//  Created by Мах Ol on 24.11.2022.
//

import Foundation
import UIKit
import Resources

private enum Constansts {
    static let titleLabelTopBottom: CGFloat = 5
    static let titleLabelLeftRight: CGFloat = 20
}

public class TitleCell: BaseTableViewCell {

    // MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = Assets.Colors.textPrimary.color
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupConstraints()
    }
    
    // MARK: - Configure
    
    public override func configure(with model: ICellIdentifiable?) {
        guard let model = model as? TitleCellViewModel else {
            return
        }
        titleLabel.text = model.title
    }
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Constansts.titleLabelTopBottom)
            $0.left.right.equalToSuperview().inset(Constansts.titleLabelLeftRight)
        }
    }
}
