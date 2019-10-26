//
//  TrendContentManager.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

protocol TrendContentManagerProtocol {
    func getTrend(for currency: String, completion: @escaping (TrendViewModel) -> ())
}

class TrendContentManager: TrendContentManagerProtocol {
    private let requestDispatcher = RequestDispatcher(environment: EnvironmentCreator.environment(for: .prod))
    private let dates = [
        "2019-01-01",
        "2019-02-01",
        "2019-03-01",
        "2019-04-01",
        "2019-05-01",
        "2019-06-01",
        "2019-07-01"
    ]

    func getTrend(for currency: String, completion: @escaping (TrendViewModel) -> ()) {
        let dispatchGroup = DispatchGroup()
        var trends = [Trend](repeating: Trend.empty, count: dates.count)

        DispatchQueue.global(qos: .background).async {
            for (index, date) in self.dates.enumerated() {
               dispatchGroup.enter()
                TrendTask(date: date).execute(in: self.requestDispatcher) { result in
                    var state: Trend.State = .notAvailable
                    var currencyValue: Float = 0

                    switch result {
                    case let .data(currencyOverview):
                        state = .valid
                        currencyValue = currencyOverview.currencies[currency] ?? 0
                    default:
                        break

                    }

                    let trend = Trend(state: state,
                                      currency: currency,
                                      date: date,
                                      value: currencyValue)
                    trends[self.dates.count - 1 - index] = trend
                    dispatchGroup.leave()
                }
            }
            dispatchGroup.wait()
            
            DispatchQueue.main.async {
                if trends.first(where: { $0.state == .valid }) != nil {
                    completion(.data(TrendViewModelData(currency: currency, trends: trends)))
                    return
                }

                completion(.error)
            }
        }
    }
}

