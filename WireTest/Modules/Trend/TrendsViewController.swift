//
//  TrendsViewController.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import UIKit

protocol TrendsViewProtocol: class {
    func refresh(with viewModel: TrendsViewModel)
}

class TrendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private var errorView: ErrorView!
    @IBOutlet private var loadingView: LoadingView!
    @IBOutlet private var tableView: UITableView!

    var presenter: TrendsPresenterProtocol!

    private var trends: [Trend] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureTableView()
    }

    // MARK: Private Methods

    private func configureTableView() {
        tableView.estimatedRowHeight = TrendCell.height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: TrendCell.self)
    }

    // MARK: IBAction Methods

    @IBAction private func errorViewTouchUpInside(_ sender: Any) {
        presenter?.didTapRetry()
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrendCell = tableView.dequeueReusableCell(withIdentifier: "TrendCell",
                                                            for: indexPath) as! TrendCell
        let viewModel = indexPath.row == trends.count - 1
            ? TrendCellViewModel(trend: trends[indexPath.row])
            : TrendCellViewModel(trend: trends[indexPath.row], previousTrend: trends[indexPath.row + 1])
        cell.configure(with: viewModel)
        return cell
    }
}

// MARK: - TrendsViewProtocol

extension TrendsViewController: TrendsViewProtocol {
    func refresh(with viewModel: TrendsViewModel) {
        DispatchQueue.main.async {
            if case .data(let trends) = viewModel {
                self.title = trends.title
                self.trends = trends.items
            }
            self.errorView.isHidden = !viewModel.isError
            self.loadingView.isHidden = !viewModel.isLoading
        }
    }
}
