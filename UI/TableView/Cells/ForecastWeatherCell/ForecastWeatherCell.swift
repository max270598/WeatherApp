//
//  ForecastWeatherCell.swift
//  UI
//
//  Created by Мах Ol on 23.11.2022.
//

import Foundation
import UIKit
import Resources

private enum Constants {
    static let mainStackViewLeftRight: CGFloat = 20
    static let weatherImageViewWidthHeight: CGFloat = 30
}

public class ForecastWeatherCell: BaseTableViewCell {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.textColor = Assets.Colors.textPrimary.color
        
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = Assets.Colors.textPrimary.color
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
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
        mainStackView.addArrangedSubview(dayLabel)
        mainStackView.addArrangedSubview(weatherImageView)
        mainStackView.addArrangedSubview(maxTempLabel)
        mainStackView.addArrangedSubview(minTempLabel)
        addSubview(mainStackView)
        
        weatherImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.weatherImageViewWidthHeight)
        }
        
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Constants.mainStackViewLeftRight)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    public override func configure(with viewModel: ICellIdentifiable?) {
        guard let viewModel = viewModel as? ForecastWeatherCellViewModel else {
            return
        }
        
        dayLabel.text = viewModel.dayName
        maxTempLabel.text = viewModel.maxTemp
        minTempLabel.text = viewModel.minTemp
        weatherImageView.kf.setImage(with: viewModel.imageUrl)
    }
}
