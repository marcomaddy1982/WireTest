//
//  CurrenciesViewModelSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

import Nimble
import Quick
@testable import WireTest

class CurrenciesViewModelSpec: QuickSpec {

    override func spec() {
        describe("currenciesViewModel") {
            context("controller state") {
                it("isLoading") {
                    let isLoadingViewModel = CurrenciesViewModel.loading
                    expect(isLoadingViewModel.isLoading).to(equal(true))
                    expect(isLoadingViewModel.isError).to(equal(false))
                }
            }

            context("controller state") {
                it("isError") {
                    let isErrorViewModel = CurrenciesViewModel.error
                    expect(isErrorViewModel.isLoading).to(equal(false))
                    expect(isErrorViewModel.isError).to(equal(true))
                }
            }

            context("controller state") {
                it("valid data") {
                    let data = CurrenciesViewModelData(currencyOverview: MockCurrencyOwerview.overview)
                    let hasDataViewModel = CurrenciesViewModel.data(data)
                    expect(hasDataViewModel.isLoading).to(equal(false))
                    expect(hasDataViewModel.isError).to(equal(false))
                }
            }
        }
    }
}
