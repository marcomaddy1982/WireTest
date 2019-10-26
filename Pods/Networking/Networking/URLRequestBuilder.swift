//
//  URLRequestBuilder.swift
//  Networking
//
//  Created by Marco Maddalena on 19.02.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

protocol URLRequestBuilding {
    func urlRequest(withRequest request: Request) throws -> URLRequest?
}

final class URLRequestBuilder: URLRequestBuilding {
    
    private let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }

    func urlRequest(withRequest request: Request) throws -> URLRequest? {
        let url = try prepareUrl(forRequest: request)
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = request.method.rawValue
        let headers = try prepareHeaders(forRequest: request)
        headers.forEach {
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        }
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        urlRequest.httpBody = try prepareBody(forRequest: request)
        
        return urlRequest
    }

    private func prepareBody(forRequest request: Request) throws -> Data? {
        guard let parameters = request.parameters else {
            return nil
        }
        return try JSONSerialization.data(withJSONObject: parameters, options: .init(rawValue: 0))
    }

    private func prepareUrl(forRequest request: Request) throws -> URL {
        var components = URLComponents(string: "\(environment.host)/\(request.path)")
        components?.queryItems = request.queryItems

        if let url = components?.url {
            return url
        } else {
            throw NetworkError.badURL
        }
    }

    private func prepareHeaders(forRequest request: Request) throws -> [String: String] {
        var headers = environment.headers

        if let requestHeaders = request.headers {
            headers = headers.merging(requestHeaders) { (_, new) in new }
        }

        return headers
    }
}
