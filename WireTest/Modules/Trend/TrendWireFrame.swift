//
//  TrendWireFrame.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

struct TrendWireFrame {
    private var currency: String
    init(currency: String) {
        self.currency = currency
    }

    func build(router: TrendRouter) -> TrendViewController {

        let viewController = TrendViewController.instantiateFromStoryboard(withName: "Trend")
        let presenter = TrendPresenter()
        let contentManager = TrendContentManager()
        let interactor = TrendInteractor(currency: currency,
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

