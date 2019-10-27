//
//  MockCurrenciesInteractor.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

@testable import WireTest

class MockCurrenciesInteractor: CurrenciesInteractorProtocol {
    private(set) var isLoadContentsCalled = false
    private(set) var cantentManager: CurrenciesContentManagerProtocol

    init(cantentManager: CurrenciesContentManagerProtocol) {
        self.cantentManager = cantentManager
    }

    func loadContents() {
        self.isLoadContentsCalled = true
    }

    func filterCurrencies(for searchText: String) { }
}
