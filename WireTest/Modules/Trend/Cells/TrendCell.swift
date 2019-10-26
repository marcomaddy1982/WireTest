//
//  TrendCell.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Reusable

extension TrendCell {
    public static let height: CGFloat = 60.0
}

class TrendCell: UITableViewCell {

    @IBOutlet private var labelDate: UILabel!
    @IBOutlet private var labelCurrencyValue: UILabel!
    @IBOutlet private var labelTrend: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        labelDate.text = nil
        labelCurrencyValue.text = nil
        labelTrend.text = nil
    }

    // MARK: Public Methods

    func configure(with viewModel: TrendCellViewModel) {
        labelDate.text = viewModel.dateText
        labelCurrencyValue.text = viewModel.currencyValueText
        labelTrend.text = viewModel.trendText
    }
}

extension TrendCell: NibReusable { }

