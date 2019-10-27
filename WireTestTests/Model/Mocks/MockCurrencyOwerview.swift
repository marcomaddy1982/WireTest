//
//  MockCurrencyOwerview.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
@testable import WireTest

struct MockCurrencyOwerview {
    static var valid: Data {
        let mockJSONFile = Bundle(for: CurrencyOwerviewSpec.self).path(forResource: "currenciesMockPass", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var invalid: Data {
        let mockJSONFile = Bundle(for: CurrencyOwerviewSpec.self).path(forResource: "currenciesMockFail", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var overview: CurrencyOwerview = CurrencyOwerview(currencies: ["HKD": 8.7048, "ISK": 138.3, "PHP": 56.951],
                                                             date: "2019-10-25",
                                                             base: "EUR")
}
