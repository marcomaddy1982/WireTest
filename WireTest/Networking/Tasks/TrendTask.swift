//
//  TrendTask.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

final class TrendTask: JSONTask {
    typealias Output = CurrencyOwerview

    let date: String
    init(date: String) {
        self.date = date
    }

    var state: TaskState = .none

    var request: Request {
        return TrendRequest(date: date)
    }
}
