//
//  TrendsRouter.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import UIKit

protocol TrendsRouterProtocol { }

class TrendsRouter {
    var viewController: UIViewController {
        let viewController = _viewController ?? builder.build(router: self)
        _viewController = viewController
        return viewController
    }

    private let builder: TrendsWireFrame
    private weak var _viewController: TrendsViewController?

    init(currency: String) {
        builder = TrendsWireFrame(currency: currency)
    }
}

extension TrendsRouter: TrendsRouterProtocol { }
