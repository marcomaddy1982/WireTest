//
//  CurrenciesViewModel.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

enum CurrenciesViewModel {
    case data([String])
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
