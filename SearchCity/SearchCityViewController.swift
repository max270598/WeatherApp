//
//  SearchCityViewController.swift
//  ChooseCity
//
//  Created by Мах Ol on 24.11.2022.
//

import UIKit
import UI
import SnapKit
import Resources

public class SearchCityViewController: UIViewController {
    
    // MARK: - Dependencies

    public var viewModel: SearchCityViewModel!

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
    
    private lazy var searchController: UISearchController = {
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchResultsUpdater = self
        searchVC.searchBar.delegate = self
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.setValue(L10n.SearchBar.cancel, forKey: "cancelButtonText")
        searchVC.searchBar.placeholder = L10n.CitySearch.cityName
        definesPresentationContext = true
        return searchVC
    }()
    
    // MARK: - Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        setupBindings()
    }
    
    // MARK: - Setup
    
    private func setup() {
        tableView.tableHeaderView = searchController.searchBar
        view.backgroundColor = Assets.Colors.backgroundPrimary.color
        title = L10n.CitySearch.searchCity
        navigationItem.backButtonTitle = L10n.Navigation.back
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
        
        viewModel.error?.bind { [weak self] error in
            let alertVC = UIAlertController(title: L10n.Alerts.errorTitle, message: L10n.Alerts.somethingWentWrong, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: L10n.Alerts.ok, style: .cancel)
            alertVC.addAction(alertAction)
            self?.present(alertVC, animated: true)
        }
    }
    
    // MARK: - Private
    
    private func registerCells() {
        tableView.register(TitleCell.self, forCellReuseIdentifier: "TitleCell")
    }
}

// MARK: - UITableViewDelegate

extension SearchCityViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
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

extension SearchCityViewController: UITableViewDataSource {
    
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
        viewModel.didSelectRow(indexPath: indexPath)
        searchController.isActive = false
        dismiss(animated: true)
    }
}

// MARK: - UISearchResultsUpdating

extension SearchCityViewController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        viewModel.fetchLocation(forPlaceCalled: searchController.searchBar.text ?? "")
    }
}

// MARK: - UISearchBarDelegate

extension SearchCityViewController: UISearchBarDelegate {
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
}

