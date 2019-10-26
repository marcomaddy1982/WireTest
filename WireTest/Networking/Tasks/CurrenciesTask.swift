//
//  CurrenciesTask.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

final class CurrenciesTask: JSONTask {
    typealias Output = CurrencyOwerview

    var state: TaskState = .none

    var request: Request {
        return CurrenciesRequest()
    }
}
