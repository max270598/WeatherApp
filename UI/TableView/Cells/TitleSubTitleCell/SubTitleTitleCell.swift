//
//  SubTitleTitleCell.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation
import UIKit
import Resources

private enum Constansts {
//    static let
}

public class SubTitleTitleCell: BaseTableViewCell {

    // MARK: - Views
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = Assets.Colors.textSecondary.color
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = Assets.Colors.textPrimary.color
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
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
        guard let model = model as? SubTitleTitleCellViewModel else {
            return
        }
        subTitleLabel.text = model.subTitle
        titleLabel.text = model.title
    }
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        stackView.addArrangedSubview(subTitleLabel)
        stackView.addArrangedSubview(titleLabel)
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(70)
        }
    }
}
