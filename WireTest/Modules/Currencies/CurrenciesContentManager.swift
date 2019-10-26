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
    private var viewModel: CurrenciesViewModel?

    func getCurrencies(completion: @escaping (CurrenciesViewModel) -> ()) {
        CurrenciesTask().execute(in: requestDispatcher) { result in
            switch result {
            case let .data(currencyOverview):
                let currencies = currencyOverview.currencies.keys.sorted(by: <)
                self.viewModel = .data(currencies)
                completion(.data(currencies))

                // Without CoreData
//                guard let coredataManager = self.coredataManager else { return }
//                currencies.forEach { Currency.insert(currency: $0, in: coredataManager.privateContext) }
//                try? coredataManager.saveContext()
            case .error:
                completion(.error)
            }
        }
    }

    func filterCurrencies(for searchText: String, completion: @escaping (CurrenciesViewModel) -> ()) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        // Without CoreData
        if case .data(let currencies) = viewModel, !trimmedSearchText.isEmpty {
            let filteredCurrency = currencies.filter {
                $0.uppercased().contains(trimmedSearchText.uppercased())
            }
            completion(.data(filteredCurrency))

        } else {
            guard let viewModel = viewModel else { return }
            completion(viewModel)
        }

        // Without CoreData
//        guard let coredataManager = self.coredataManager else { return }
//        let currencies = Currency.fetch(for: trimmedSearchText, in: coredataManager.privateContext).map { $0.name }
//        completion(.data(currencies))
    }
}
