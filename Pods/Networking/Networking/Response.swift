//
//  Response.swift
//  Networking
//
//  Created by Marco Maddalena on 19.02.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

/// Defines different error states that might occur during a network call
///
/// - badURL: The URL could not be build while preparing the network request.
/// - badInput: Some data (e.g. to put into http body) is invalid.
/// - badContent: The server response is valid could not be parsed into the expected output.
/// - badRequest: The sever resonded with error code 400
/// - unauthorized: The sever resonded with error code 401
/// - incompleteSignatureException: The sever resonded with error code 403
/// - notFound: The sever resonded with error code 404
/// - server: Internal server error
/// - badNetwork: Some underlaying components where unable to fully execute the call due to bad network
/// - cancelled: The call got cancelled
/// - fallback: Some undefined error happened
public enum NetworkError: Error {
    // Request (building) errors
    case badURL
    case badInput

    // Response errors
    case badContent
    case badRequest
    case unauthorized
    case incompleteSignatureException
    case notFound
    case server(statusCode: Int)

    // URLSession API errors
    case badNetwork(underlayingError: Error)
    case cancelled(underlayingError: Error)

    case fallback(underlayingError: Error?, statusCode: Int?)

    fileprivate init(error: Error?) {
        guard let error = error else {
            self = .fallback(underlayingError: nil, statusCode: nil)
            return
        }

        switch (error as NSError).code {
        case NSURLErrorCancelled:
            self = .cancelled(underlayingError: error)
        case NSURLErrorTimedOut, NSURLErrorCannotConnectToHost, NSURLErrorNetworkConnectionLost, NSURLErrorNotConnectedToInternet:
            self = .badNetwork(underlayingError: error)
        default:
            self = .fallback(underlayingError: error, statusCode: nil)
        }
    }

    fileprivate init(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .incompleteSignatureException
        case 404:
            self = .notFound
        case (500..<600):
            self = .server(statusCode: statusCode)
        default:
            self = .fallback(underlayingError: nil, statusCode: statusCode)
        }
    }
}

extension NetworkError: Equatable {
    public static func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (let err1, let err2):
            return (err1 as NSError).code == (err2 as NSError).code
        }
    }
}

public enum Response {
    case success(Data?)
    case failure(error: NetworkError)

    public init(response: HTTPURLResponse?, data: Data?, error: Error?) {
        guard let response = response else {
            self = .failure(error: NetworkError(error: error))
            return
        }

        if (200..<300).contains(response.statusCode) {
            self = .success(data)
        } else {
            self = .failure(error: NetworkError(statusCode: response.statusCode))
        }
    }
}
