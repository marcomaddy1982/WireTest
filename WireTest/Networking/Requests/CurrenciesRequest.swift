//
//  CurrenciesRequest.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Networking

struct CurrenciesRequest: Request {
    let path: String = "latest"
}
