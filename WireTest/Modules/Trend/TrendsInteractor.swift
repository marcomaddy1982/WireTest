//
//  TrendsInteractor.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

protocol TrendsInteractorProtocol {
    func loadContents()
}

class TrendsInteractor {
    weak var presenter: TrendsPresenterProtocol!
    private var contentManager: TrendsContentManagerProtocol!
    private var currency: String!

    init(currency: String, contentManager: TrendsContentManagerProtocol) {
        self.currency = currency
        self.contentManager = contentManager
    }
}

extension TrendsInteractor: TrendsInteractorProtocol {
    func loadContents() {
        presenter.refresh(with: .loading)
        contentManager.getTrends(for: currency) { [weak self] trendViewModel in
            self?.presenter.refresh(with: trendViewModel)
        }
    }
}
