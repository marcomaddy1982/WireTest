//
//  CurrenciesRouter.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import UIKit

protocol CurrenciesRouterProtocol {
    func showTrend(for currency: String)
}

class CurrenciesRouter {
    var viewController: UIViewController {
        let viewController = _viewController ?? builder.build(router: self)
        _viewController = viewController
        return viewController
    }

    private let builder: CurrenciesWireFrame
    private weak var _viewController: CurrenciesViewController?

    init() {
        builder = CurrenciesWireFrame()
    }
}

extension CurrenciesRouter: CurrenciesRouterProtocol {
    func showTrend(for currency: String) {
        let trendRouter = TrendRouter(currency: currency)
        viewController.navigationController?.pushViewController(trendRouter.viewController, animated: true)
    }
}
