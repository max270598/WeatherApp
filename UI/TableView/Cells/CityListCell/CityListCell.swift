//
//  CityListCell.swift
//  UI
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation
import UIKit
import Kingfisher
import Resources

private enum Constants {
    static let mainStackViewLeftRight: CGFloat = 20
    static let mainStackViewTopBottom: CGFloat = 10
    static let weatherImageViewWidthHeight: CGFloat = 60
}

public class CityListCell: BaseTableViewCell {
    
    // MARK: - SubViews
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.textColor = Assets.Colors.textPrimary.color
        return label
    }()
    
    private lazy var weaherImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
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
    
    // MARK: Setup Constraints
    
    private func setupConstraints() {
        subStackView.addArrangedSubview(weaherImageView)
        subStackView.addArrangedSubview(tempLabel)
        mainStackView.addArrangedSubview(cityLabel)
        mainStackView.addArrangedSubview(subStackView)
        addSubview(mainStackView)
        
        weaherImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.weatherImageViewWidthHeight)
        }
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Constants.mainStackViewLeftRight)
            $0.top.bottom.equalToSuperview().inset(Constants.mainStackViewTopBottom)
        }
    }
    
    // MARK: - Configure
    
    public override func configure(with viewModel: ICellIdentifiable?) {
        guard let viewModel = viewModel as? CityListCellViewModel else {
            return
        }
        cityLabel.text = viewModel.cityName
        tempLabel.text = viewModel.temp
        weaherImageView.kf.setImage(with: viewModel.imageUrl)
    }
}

