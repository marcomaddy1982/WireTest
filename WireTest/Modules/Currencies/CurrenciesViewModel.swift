//
//  CurrenciesViewModel.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation
import CoreData

enum CurrenciesViewModel {
    case data(CurrenciesViewModelDataProtocol)
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

protocol CurrenciesViewModelDataProtocol {
    var currencies: [String] { get }
}

struct CurrenciesViewModelData: CurrenciesViewModelDataProtocol {

    private var currencyOverview: CurrencyOwerview
    private var filter: String?

    init(currencyOverview: CurrencyOwerview, filter: String? = nil) {
        self.currencyOverview = currencyOverview
        self.filter = filter
    }

    var currencies: [String] {
        guard let filterStr = filter else {
            return currencyOverview.currencies.keys.sorted(by: <)
        }

        return currencyOverview.currencies.keys.filter {
            $0.uppercased().contains(filterStr.uppercased())
        }
    }
}

struct CurrenciesViewModelCoreData: CurrenciesViewModelDataProtocol {
    private var managedContext: NSManagedObjectContext
    private var searchText: String

    init(managedContext: NSManagedObjectContext, searchText: String) {
        self.managedContext = managedContext
        self.searchText = searchText
    }

    var currencies: [String] {
        return Currency.fetch(for: searchText, in: managedContext).map { $0.name }
    }
}
