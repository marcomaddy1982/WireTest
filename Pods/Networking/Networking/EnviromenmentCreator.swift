//
//  EnviromenmentCreator.swift
//  Networking
//
//  Created by Marco Maddalena on 27.02.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

public enum Endpoint: String {
    case dev
    case prod

    fileprivate var baseURL: String {
        return "https://api.exchangeratesapi.io"
    }

    fileprivate var headers: [String: String] {
        return [:]
    }
}

public final class EnvironmentCreator {
    
    public static func environment(for endpoint: Endpoint) -> Environment {
        return Environment(host: endpoint.baseURL)
    }
}
