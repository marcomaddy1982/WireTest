//
//  TrendMock.swift
//  WireTestTests
//
//  Created by Marco Maddalena on 27.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Nimble
@testable import WireTest

struct MockTrend {
    static var valid: Trend = Trend(state: .valid, currency: "HKD", date: "2019-01-01", value: 8.7048)
    static var notAvailable: Trend = Trend(state: .notAvailable, currency: "HKD", date: "2019-01-01", value: 0)
    static var valid1: Trend = Trend(state: .valid, currency: "HKD", date: "2019-02-01", value: 8.7090)
    static var notAvailable1: Trend = Trend(state: .notAvailable, currency: "HKD", date: "2019-02-01", value: 0)
}
