//
//  CurrencyCell.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Reusable

extension CurrencyCell {
    public static let height: CGFloat = 60.0
}

class CurrencyCell: UITableViewCell {

    @IBOutlet private var labelCurrency: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        labelCurrency.text = nil
    }

    // MARK: Public Methods

    func configure(with currency: String) {
        labelCurrency.text = currency
    }
}

extension CurrencyCell: NibReusable { }
