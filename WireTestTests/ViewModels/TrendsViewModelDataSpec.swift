//
//  TrendsViewModelDataSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class TrendsViewModelDataaSpec: QuickSpec {

    override func spec() {
        describe("TrendsViewModelDataa") {
            context("trend") {
                it("valid title") {
                    let trend = Trend(state: .valid,
                                      currency: "HKD",
                                      date: "2019-01-01",
                                      value: 8.7048)
                    let data = TrendsViewModelData(currency: "HKD", trends: [trend])
                    expect(data.items.count).to(equal(1))
                    expect(data.title).to(equal("EUR to HKD"))
                }
            }
        }
    }
}
