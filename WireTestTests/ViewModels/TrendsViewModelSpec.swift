//
//  TrendsViewModelSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class TrendsViewModelSpec: QuickSpec {

    override func spec() {
        describe("currenciesViewModel") {
            context("controller state") {
                it("isLoading") {
                    let isLoadingViewModel = TrendsViewModel.loading
                    expect(isLoadingViewModel.isLoading).to(equal(true))
                    expect(isLoadingViewModel.isError).to(equal(false))
                }
            }

            context("controller state") {
                it("isError") {
                    let isErrorViewModel = TrendsViewModel.error
                    expect(isErrorViewModel.isLoading).to(equal(false))
                    expect(isErrorViewModel.isError).to(equal(true))
                }
            }

            context("controller state") {
                it("valid data") {
                    let trend = Trend(state: .valid,
                                      currency: "HKD",
                                      date: "2019-01-01",
                                      value: 8.7048)
                    let data = TrendsViewModelData(currency: "HKD", trends: [trend])
                    let hasDataViewModel = TrendsViewModel.data(data)
                    expect(hasDataViewModel.isLoading).to(equal(false))
                    expect(hasDataViewModel.isError).to(equal(false))
                }
            }
        }
    }
}

