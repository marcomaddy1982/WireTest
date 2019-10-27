//
//  CurrenciesViewModelDataSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class CurrenciesViewModelDataSpec: QuickSpec {

    override func spec() {
        describe("CurrenciesViewModelData") {
            context("currencies") {
                it("alphabetical order") {
                    let data = CurrenciesViewModelData(currencyOverview: MockCurrencyOwerview.overview)
                    expect(data.currencies.count).to(equal(3))
                    expect(data.currencies).to(equal(["HKD","ISK","PHP"]))
                }
            }

            context("currencies") {
                it("filter valid") {
                    let data = CurrenciesViewModelData(currencyOverview: MockCurrencyOwerview.overview, filter: "S")
                    expect(data.currencies.count).to(equal(1))
                    expect(data.currencies).to(equal(["ISK"]))
                }
            }

            context("currencies") {
                it("filter not valid") {
                    let data = CurrenciesViewModelData(currencyOverview: MockCurrencyOwerview.overview, filter: "A")
                    expect(data.currencies.count).to(equal(0))
                }
            }
        }
    }
}
