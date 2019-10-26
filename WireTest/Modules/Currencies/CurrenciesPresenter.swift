//
//  CurrenciesPresenter.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

protocol CurrenciesPresenterProtocol: class {
    func viewDidLoad()
    func refresh(with viewModel: CurrenciesViewModel)
    func didSelectCurrency(_ currency: String)
    func searchBarDidChange(searchText: String)
    func didTapRefresh()
    func didTapRetry()
}

class CurrenciesPresenter {

    weak var view: CurrenciesViewProtocol!
    var router: CurrenciesRouterProtocol!
    var interactor: CurrenciesInteractorProtocol!
}

extension CurrenciesPresenter: CurrenciesPresenterProtocol {

    func viewDidLoad() {
        interactor.loadContents()
    }

    func refresh(with viewModel: CurrenciesViewModel) {
        view.refresh(with: viewModel)
    }

    func didSelectCurrency(_ currency: String) {
        router.showTrend(for: currency)
    }

    func searchBarDidChange(searchText: String) {
        interactor.filterCurrencies(for: searchText)
    }

    func didTapRefresh() {
        interactor.loadContents()
    }

    func didTapRetry() {
        interactor.loadContents()
    }
}
