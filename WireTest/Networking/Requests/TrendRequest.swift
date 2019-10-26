//
//  TrendRequest.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

struct TrendRequest: Request {

    let date: String
    init(date: String) {
        self.date = date
    }

    var path: String {
        return date
    }
}
