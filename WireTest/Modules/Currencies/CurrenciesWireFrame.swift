//
//  CurrenciesWireFrame.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

struct CurrenciesWireFrame {

    func build(router: CurrenciesRouter) -> CurrenciesViewController {

        let viewController = CurrenciesViewController.instantiateFromStoryboard(withName: "Currencies")
        let presenter = CurrenciesPresenter()
        let contentManager = CurrenciesContentManager()
        let interactor = CurrenciesInteractor(contentManager: contentManager)

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
