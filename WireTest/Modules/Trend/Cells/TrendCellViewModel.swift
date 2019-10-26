//
//  TrendCellViewModel.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

struct TrendCellViewModel {
    private var trend: Trend
    private var previousTrend: Trend?

    init(trend: Trend, previousTrend: Trend? = nil) {
        self.trend = trend
        self.previousTrend = previousTrend
    }

    var dateText: String {
        return trend.date
    }

    var currencyValueText: String {
        guard trend.state == .valid else { return "n/a" }
        return String(format: "%.3f", trend.value)
    }

    var trendText: String {
        guard
            trend.state == .valid,
            let previousTrend = previousTrend,
            previousTrend.state == .valid
        else {
            return "n/a"
        }
        let value = (trend.value - previousTrend.value) * 100 / trend.value
        return String(format: "%.3f%%", value)
    }

}
