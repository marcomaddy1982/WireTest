//
//  TrendOwerview.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation

public struct Trend {
    public enum State {
        case valid
        case notAvailable
    }

    public let state: State
    public let currency: String
    public let date: String
    public let value: Float

    public static var empty: Trend = Trend(state: .notAvailable,
                                           currency: "N/A",
                                           date: "",
                                           value: 0.0)
}
