//
//  TrendsPresenter.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

protocol TrendsPresenterProtocol: class {
    func viewDidLoad()
    func refresh(with viewModel: TrendsViewModel)
    func didTapRetry()
}

class TrendsPresenter {

    weak var view: TrendsViewProtocol!
    var router: TrendsRouterProtocol!
    var interactor: TrendsInteractorProtocol!
}

extension TrendsPresenter: TrendsPresenterProtocol {

    func viewDidLoad() {
        interactor.loadContents()
    }

    func refresh(with viewModel: TrendsViewModel) {
        view.refresh(with: viewModel)
    }

    func didTapRetry() {
        interactor.loadContents()
    }
}
