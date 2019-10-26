//
//  URLRequestDispatcher.swift
//  Networking
//
//  Created by Marco Maddalena on 19.02.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

public protocol Dispatcher {
    /// Configure the dispatcher with an environment
    ///
    /// - Parameter environment: environment configuration
    init(environment: Environment)

    /// This function execute the request and provide a Promise
    /// with the response.
    ///
    /// - Parameter task: task to execute
    /// - Parameter handler: handler for request with response
    func execute<T: Task>(task: T, handler: @escaping (_ response: Response) -> Void) throws
}

public class RequestDispatcher: Dispatcher {
    let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    let environment: Environment

    public required init(environment: Environment) {
        self.environment = environment
    }

    public func execute<T: Task>(task: T, handler: @escaping (_ response: Response) -> Void) throws {
        let requestBuilder: URLRequestBuilding = URLRequestBuilder(environment: environment)
        guard let request = try requestBuilder.urlRequest(withRequest: task.request) else {
            return
        }

        task.state = .pending

        let dataTask = session.dataTask(with: request) { (data, urlResponse, error) in
            task.state = .done
            handler(Response(response: (urlResponse as? HTTPURLResponse), data: data, error: error))
        }
        dataTask.resume()
    }

}
