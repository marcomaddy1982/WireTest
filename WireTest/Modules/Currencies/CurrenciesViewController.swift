//
//  CurrenciesViewController.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import UIKit
import Reusable

protocol CurrenciesViewProtocol: class {
    func refresh(with viewModel: CurrenciesViewModel)
}

class CurrenciesViewController: UIViewController {

    @IBOutlet private var errorView: ErrorView!
    @IBOutlet private var loadingView: LoadingView!
    @IBOutlet private var searchbar: UISearchBar!
    @IBOutlet private var tableView: UITableView!

    var presenter: CurrenciesPresenterProtocol!

    private var currencies: [String] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currencies"
        configureTableView()
        presenter.viewDidLoad()
    }

    // MARK: Private Methods

    private func configureTableView() {
        tableView.estimatedRowHeight = CurrencyCell.height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: CurrencyCell.self)
    }

    // MARK: IBAction Methods

    @IBAction private func errorViewTouchUpInside(_ sender: Any) {
        presenter?.didTapRetry()
    }
}

// MARK: CurrenciesViewProtocol

extension CurrenciesViewController: CurrenciesViewProtocol {
    func refresh(with viewModel: CurrenciesViewModel) {
        DispatchQueue.main.async {
            if case .data(let currencieOverview) = viewModel {
                self.currencies = currencieOverview.currencies
            }
            self.errorView.isHidden = !viewModel.isError
            self.loadingView.isHidden = !viewModel.isLoading
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyCell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell",
                                                               for: indexPath) as! CurrencyCell
        cell.configure(with: currencies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = currencies[indexPath.row]
        presenter.didSelectCurrency(currency)
    }
}

// MARK: - UISearchBarDelegate

extension CurrenciesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchBarDidChange(searchText: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

