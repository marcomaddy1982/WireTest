//
//  MockCurrenciesPresenter.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

@testable import WireTest

class MockCurrenciesPresenter: CurrenciesPresenterProtocol {
    private(set) var isRefreshSuccessCalled = false
    private(set) var isRefreshErrorCalled = false
    private(set) var isRefreshLoadingCalled = false

    func viewDidLoad() { }

    func refresh(with viewModel: CurrenciesViewModel) {
        switch viewModel {
        case .error:
            self.isRefreshErrorCalled = true
        case .data:
            self.isRefreshSuccessCalled = true
        case .loading:
            self.isRefreshLoadingCalled = true
        }
    }

    func didSelectCurrency(_ currency: String) { }

    func didTapRefresh() { }

    func didTapRetry() { }

    func searchBarDidChange(searchText: String) { }
}
