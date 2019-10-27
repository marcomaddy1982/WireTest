//
//  TrendsWireFrame.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

struct TrendsWireFrame {
    private var currency: String
    init(currency: String) {
        self.currency = currency
    }

    func build(router: TrendsRouter) -> TrendsViewController {

        let viewController = TrendsViewController.instantiateFromStoryboard(withName: "Trends")
        let presenter = TrendsPresenter()
        let contentManager = TrendsContentManager()
        let interactor = TrendsInteractor(currency: currency,
                                          contentManager: contentManager)

        // VC
        viewController.presenter = presenter

        // Presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        // Interactor
        interactor.presenter = presenter

        return viewController
    }
}

