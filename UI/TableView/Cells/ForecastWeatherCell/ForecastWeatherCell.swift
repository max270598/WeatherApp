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
    static let mainStackViewTopBottom: CGFloat = 5
    static let weatherImageViewWidthHeight: CGFloat = 40
}

public class ForecastWeatherCell: BaseTableViewCell {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
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
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.textColor = Assets.Colors.textPrimary.color
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
        mainStackView.addArrangedSubview(tempLabel)
        addSubview(mainStackView)
        
        weatherImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.weatherImageViewWidthHeight)
            $0.centerX.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Constants.mainStackViewLeftRight)
            $0.top.bottom.equalToSuperview().inset(Constants.mainStackViewTopBottom)
        }
    }
    
    // MARK: - Configure
    
    public override func configure(with viewModel: ICellIdentifiable?) {
        guard let viewModel = viewModel as? ForecastWeatherCellViewModel else {
            return
        }
        
        dayLabel.text = viewModel.dayAndTime
        tempLabel.text = viewModel.temp
        weatherImageView.kf.setImage(with: viewModel.imageUrl)
    }
}
