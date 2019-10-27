//
//  CurrenciesContentManagerMock.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

@testable import WireTest

class MockCurrenciesContentManager: CurrenciesContentManagerProtocol {
    func getCurrencies(completion: @escaping (CurrenciesViewModel) -> ()) {
        let data = CurrenciesViewModelData(currencyOverview: MockCurrencyOwerview.overview)
        completion(.data(data))
    }

    func filterCurrencies(for searchText: String, completion: @escaping (CurrenciesViewModel) -> ()) {
        let data = CurrenciesViewModelData(currencyOverview: MockCurrencyOwerview.overview)
        completion(.data(data))
    }
}

class MockCurrenciesContentManagerError: CurrenciesContentManagerProtocol {
    func getCurrencies(completion: @escaping (CurrenciesViewModel) -> ()) {
        completion(.error)
    }

    func filterCurrencies(for searchText: String, completion: @escaping (CurrenciesViewModel) -> ()) {
        completion(.error)
    }
}
