//
//  TrendsViewModel.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

enum TrendsViewModel {
    case data(TrendsViewModelData)
    case error
    case loading

    var isLoading: Bool {
        guard case .loading = self else { return false }
        return true
    }

    var isError: Bool {
        guard case .error = self else { return false }
        return true
    }
}

struct TrendsViewModelData {
    private var currency: String
    private var trends: [Trend]

    init(currency: String, trends: [Trend]) {
        self.currency = currency
        self.trends = trends
    }

    var title: String {
        return "EUR to \(currency)"
    }

    var items: [Trend] {
        return trends
    }

}
