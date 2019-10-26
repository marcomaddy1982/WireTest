//
//  Request.swift
//  Networking
//
//  Created by Marco Maddalena on 19.02.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

public protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

public extension Request {
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}

public enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}
