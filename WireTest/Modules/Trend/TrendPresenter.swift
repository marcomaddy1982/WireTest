//
//  TrendPresenter.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

protocol TrendPresenterProtocol: class {
    func viewDidLoad()
    func refresh(with viewModel: TrendViewModel)
    func didTapRetry()
}

class TrendPresenter {

    weak var view: TrendViewProtocol!
    var router: TrendRouterProtocol!
    var interactor: TrendInteractorProtocol!
}

extension TrendPresenter: TrendPresenterProtocol {

    func viewDidLoad() {
        interactor.loadContents()
    }

    func refresh(with viewModel: TrendViewModel) {
        view.refresh(with: viewModel)
    }

    func didTapRetry() {
        interactor.loadContents()
    }
}
