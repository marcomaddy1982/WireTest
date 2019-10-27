//
//  TrendCellViewModelSpecs.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class TrendCellViewModelSpecs: QuickSpec {

    override func spec() {
        describe("trendCellViewModelSpecs") {
            context("no previous trend") {
                it("current trend valid") {
                    let cellViewModel = TrendCellViewModel(trend: MockTrend.valid)
                    expect(cellViewModel.trendText).to(equal("n/a"))
                    expect(cellViewModel.dateText).to(equal("2019-01-01"))
                    expect(cellViewModel.currencyValueText).to(equal("8.705"))
                }

                it("current trend notAvailable") {
                    let cellViewModel = TrendCellViewModel(trend: MockTrend.notAvailable)
                    expect(cellViewModel.trendText).to(equal("n/a"))
                    expect(cellViewModel.dateText).to(equal("2019-01-01"))
                    expect(cellViewModel.currencyValueText).to(equal("n/a"))
                }
            }

            context("previous trend valid") {
                it("current trend valid") {
                    let cellViewModel = TrendCellViewModel(trend: MockTrend.valid, previousTrend: MockTrend.valid1)
                    expect(cellViewModel.trendText).to(equal("-0.048%"))
                    expect(cellViewModel.dateText).to(equal("2019-01-01"))
                    expect(cellViewModel.currencyValueText).to(equal("8.705"))
                }
            }

            context("previous trend notAvailable") {
                it("current trend valid") {
                    let cellViewModel = TrendCellViewModel(trend: MockTrend.notAvailable, previousTrend: MockTrend.valid1)
                    expect(cellViewModel.trendText).to(equal("n/a"))
                    expect(cellViewModel.dateText).to(equal("2019-01-01"))
                    expect(cellViewModel.currencyValueText).to(equal("n/a"))
                }

                it("current trend notAvailble") {
                    let cellViewModel = TrendCellViewModel(trend: MockTrend.notAvailable, previousTrend: MockTrend.notAvailable1)
                    expect(cellViewModel.trendText).to(equal("n/a"))
                    expect(cellViewModel.dateText).to(equal("2019-01-01"))
                    expect(cellViewModel.currencyValueText).to(equal("n/a"))
                }
            }
        }
    }
}
