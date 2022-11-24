//
//  WeatherDetailHeadlineCell.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation
import UIKit
import Resources

private enum Constants {
    static let mainStackViewLeftRight: CGFloat = 20
}

public class WeatherDetailHeadlineCell: BaseTableViewCell {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24)
        label.textColor = Assets.Colors.textPrimary.color

        return label
    }()
        
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.textColor = Assets.Colors.textPrimary.color
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = Assets.Colors.textSecondary.color
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup() {
        backgroundColor = .clear
    }
    
    // MARK: SetupConstraints
    
    private func setupConstraints() {
        mainStackView.addArrangedSubview(cityLabel)
        mainStackView.addArrangedSubview(tempLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        addSubview(mainStackView)
        
        
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Constants.mainStackViewLeftRight)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    public override func configure(with viewModel: ICellIdentifiable?) {
        guard let viewModel = viewModel as? WeatherDetailHeadlineViewModel else {
            return
        }
        
        cityLabel.text = viewModel.cityName
        tempLabel.text = viewModel.temp
        descriptionLabel.text = viewModel.description
    }
}

