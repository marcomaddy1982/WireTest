//
//  CurrenciesInteractor.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

protocol CurrenciesInteractorProtocol {
    func loadContents()
    func filterCurrencies(for searchText: String)
}

class CurrenciesInteractor {
    weak var presenter: CurrenciesPresenterProtocol!
    private var contentManager: CurrenciesContentManagerProtocol!
    private var viewModel: CurrenciesViewModel?

    init(contentManager: CurrenciesContentManagerProtocol) {
        self.contentManager = contentManager
    }
}

extension CurrenciesInteractor: CurrenciesInteractorProtocol {
    func loadContents() {
        presenter.refresh(with: .loading)
        contentManager.getCurrencies(completion: { [weak self] viewModel in
            self?.presenter.refresh(with: viewModel)
        })
    }

    func filterCurrencies(for searchText: String) {
        contentManager.filterCurrencies(for: searchText, completion: { [weak self] viewModel in
            self?.presenter.refresh(with: viewModel)
        })
    }
}
