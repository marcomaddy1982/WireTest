//
//  CurrenciesContentManager.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

protocol CurrenciesContentManagerProtocol {
    func getCurrencies(completion: @escaping (CurrenciesViewModel) -> ())
    func filterCurrencies(for searchText: String, completion: @escaping (CurrenciesViewModel) -> ())
}

class CurrenciesContentManager: CurrenciesContentManagerProtocol {
    private let requestDispatcher = RequestDispatcher(environment: EnvironmentCreator.environment(for: .prod))
    private let coredataManager = CoreDataManager(modelName: "Wire")
    private var currencyOverview: CurrencyOwerview?

    func getCurrencies(completion: @escaping (CurrenciesViewModel) -> ()) {
        CurrenciesTask().execute(in: requestDispatcher) { [weak self] result in
            switch result {
            case let .data(currencyOverview):
                self?.currencyOverview = currencyOverview
                completion(.data(CurrenciesViewModelData(currencyOverview: currencyOverview)))

                /*
                // For Filtering using CoreData
                guard let coredataManager = self?.coredataManager else { return }
                let data = CurrenciesViewModelData(currencyOverview: currencyOverview)
                data.currencies.forEach { Currency.insert(currency: $0, in: coredataManager.privateContext) }
                try? coredataManager.saveContext()
                */

            case .error:
                completion(.error)
            }
        }
    }

    func filterCurrencies(for searchText: String, completion: @escaping (CurrenciesViewModel) -> ()) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        // Without CoreData
        if let currencyOverview = currencyOverview, !trimmedSearchText.isEmpty {
            completion(.data(CurrenciesViewModelData(currencyOverview: currencyOverview,
                                                     filter: trimmedSearchText)))
        } else {
            guard let currencyOverview = currencyOverview else { return }
            completion(.data(CurrenciesViewModelData(currencyOverview: currencyOverview)))
        }

        /*
        // For Filtering using CoreData
        guard let coredataManager = self.coredataManager else { return }
        completion(.data(CurrenciesViewModelCoreData(managedContext: coredataManager.privateContext,
                                                     searchText: trimmedSearchText)))
        */
        
    }
}
