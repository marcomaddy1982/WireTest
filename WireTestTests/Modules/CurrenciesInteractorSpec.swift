//
//  CurrenciesInteractorSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class CurrenciesInteractorSpec: QuickSpec {

    override func spec() {
        var presenter: MockCurrenciesPresenter?
        var manager: CurrenciesContentManagerProtocol?
        var interactor: CurrenciesInteractor?

        beforeEach {
            presenter = MockCurrenciesPresenter()
        }

        describe("currenciesInteractor") {
            context("load currencies") {
                it("success") {
                    manager = MockCurrenciesContentManager()
                    interactor = CurrenciesInteractor(contentManager: manager!)
                    interactor?.presenter = presenter
                    interactor?.loadContents()
                    expect(presenter?.isRefreshSuccessCalled).to(equal(true))
                    expect(presenter?.isRefreshLoadingCalled).to(equal(true))
                    expect(presenter?.isRefreshErrorCalled).to(equal(false))
                }
            }
        }

        describe("currenciesInteractor") {
            context("load currencies") {
                it("error") {
                    manager = MockCurrenciesContentManagerError()
                    interactor = CurrenciesInteractor(contentManager: manager!)
                    interactor?.presenter = presenter
                    interactor?.loadContents()
                    expect(presenter?.isRefreshSuccessCalled).to(equal(false))
                    expect(presenter?.isRefreshLoadingCalled).to(equal(true))
                    expect(presenter?.isRefreshErrorCalled).to(equal(true))
                }
            }
        }

        afterEach {
            manager = nil
            presenter = nil
            interactor = nil
        }
    }
}
