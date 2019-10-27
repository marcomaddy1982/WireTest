//
//  CurrenciesPresenterSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class CurrenciesPresenterSpec: QuickSpec {
    override func spec() {
        var view: MockCurrenciesView?
        var router: CurrenciesRouterProtocol?
        var presenter: CurrenciesPresenter?

        beforeEach {
            view = MockCurrenciesView()
            router = CurrenciesRouter()
            presenter = CurrenciesPresenter()
        }

        describe("currenciesPresenter") {
            context("load currencies") {
                it("isRefreshCalled") {
                    presenter?.view = view
                    presenter?.router = router
                    presenter?.refresh(with: .error)
                    expect(view?.isRefreshCalled).to(equal(true))
                }
            }
        }

        afterEach {
            view = nil
            router = nil
        }
    }
}

