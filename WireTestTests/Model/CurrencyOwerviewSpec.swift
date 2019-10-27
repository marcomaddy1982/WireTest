//
//  CurrencyOwerviewSpec.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
import Quick
@testable import WireTest

class CurrencyOwerviewSpec: QuickSpec {

    override func spec() {

        let decoder: JSONDecoder = JSONDecoder()

        describe("decoding") {
            context("valid JSON") {
                it("succeeds") {
                    let currenciesOverview = try? decoder.decode(CurrencyOwerview.self,
                                                                 from: MockCurrencyOwerview.valid)
                    expect(currenciesOverview?.currencies.count).to(equal(32))
                    expect(currenciesOverview?.base).to(equal("EUR"))
                    expect(currenciesOverview?.date).to(equal("2019-10-25"))
                }
            }

            context("invalid JSON") {
                it("fails") {
                    let currenciesOverview = try? decoder.decode(CurrencyOwerview.self,
                                                                 from: MockCurrencyOwerview.invalid)
                    expect(currenciesOverview).to(beNil())
                }
            }
        }
    }
}
