//
//  CityListViewController.swift
//  CityList
//
//  Created by Мах Ol on 19.11.2022.
//

import UIKit
import UI
import SnapKit
import Resources
import WeatherDetails

public class CityListViewController: UIViewController {
    
    // MARK: - Dependencies

    public var viewModel: CityListViewModel!

    // MARK: - Subviews

   private lazy var tableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .grouped)
       tableView.backgroundColor = .clear
       tableView.separatorStyle = .singleLine
       tableView.allowsSelection = true
       tableView.estimatedRowHeight = 75
       tableView.rowHeight = UITableView.automaticDimension
       tableView.backgroundColor = .clear
       tableView.delegate = self
       tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Lifecycle


    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        setupBindings()
        viewModel.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = Assets.Colors.backgroundPrimary.color
        title = L10n.CityList.watchingCities
        registerCells()
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.pinToEdges()
    }
    
    // MARK: - Setup Bindings
    
    private func setupBindings() {
        viewModel.sections.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.error.bind { [weak self] in
            let alertVC = UIAlertController(title: L10n.Alerts.errorTitle, message: $0.description, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: L10n.Alerts.ok, style: .cancel)
            alertVC.addAction(alertAction)
            self?.present(alertVC, animated: true)
        }
    }
    
    // MARK: - Routing
    
    private func routeToDetails(indexPath: IndexPath) {
        let city = viewModel.cities[indexPath.row]
        let weatherDetailsVM = WeatherDetailsViewModel(city: city)
        let weatherDetailsVC = WeatherDetailsViewController()
        weatherDetailsVC.viewModel = weatherDetailsVM
        navigationController?.pushViewController(weatherDetailsVC, animated: true)
    }
    
    // MARK: - Private
    
    private func registerCells() {
        tableView.register(CityListCell.self, forCellReuseIdentifier: "CityListCell")
    }
}

// MARK: - UITableViewDelegate

extension CityListViewController: UITableViewDelegate {
    
    public  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard viewModel.sections.value[section].headerViewModel != nil else { return 0 }
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerViewModel = viewModel.sections.value[section].headerViewModel else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: headerViewModel.headerFooterIdentifier
        ) as? BaseHeaderFooterView
        view?.configure(with: headerViewModel)
        return view
    }
}

// MARK: - UITableViewDataSource

extension CityListViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.value.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections.value[section].rowViewModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel.sections.value[indexPath.section].rowViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier,
                                                 for: indexPath) as? BaseTableViewCell
        cell?.configure(with: cellModel)
        return cell ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routeToDetails(indexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            viewModel.removeRow(indexPath: indexPath)
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
}
