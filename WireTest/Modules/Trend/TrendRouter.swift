//
//  TrendRouter.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import UIKit

protocol TrendRouterProtocol { }

class TrendRouter {
    var viewController: UIViewController {
        let viewController = _viewController ?? builder.build(router: self)
        _viewController = viewController
        return viewController
    }

    private let builder: TrendWireFrame
    private weak var _viewController: TrendViewController?

    init(currency: String) {
        builder = TrendWireFrame(currency: currency)
    }
}

extension TrendRouter: TrendRouterProtocol { }
