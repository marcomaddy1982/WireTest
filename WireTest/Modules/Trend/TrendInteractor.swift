//
//  TrendInteractor.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

protocol TrendInteractorProtocol {
    func loadContents()
}

class TrendInteractor {
    weak var presenter: TrendPresenterProtocol!
    private var contentManager: TrendContentManagerProtocol!
    private var currency: String!

    init(currency: String, contentManager: TrendContentManagerProtocol) {
        self.currency = currency
        self.contentManager = contentManager
    }
}

extension TrendInteractor: TrendInteractorProtocol {
    func loadContents() {
        presenter.refresh(with: .loading)
        contentManager.getTrend(for: currency) { [weak self] trendViewModel in
            self?.presenter.refresh(with: trendViewModel)
        }
    }
}
