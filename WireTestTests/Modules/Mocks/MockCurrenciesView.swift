//
//  MockCurrenciesView.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

@testable import WireTest

class MockCurrenciesView: CurrenciesViewProtocol {
    private(set) var isRefreshCalled = false

    func refresh(with viewModel: CurrenciesViewModel) {
        self.isRefreshCalled = true
    }
}
