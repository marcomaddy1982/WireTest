//
//  TrendsTask.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

final class TrendsTask: JSONTask {
    typealias Output = CurrencyOwerview

    let date: String
    init(date: String) {
        self.date = date
    }

    var state: TaskState = .none

    var request: Request {
        return TrendsRequest(date: date)
    }
}
