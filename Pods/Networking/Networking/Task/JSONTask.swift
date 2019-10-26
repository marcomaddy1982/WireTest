//
//  JSONTask.swift
//  Networking
//
//  Created by Marco Maddalena on 19.02.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

public protocol JSONTask: Task where Output: Decodable { }

public extension JSONTask {
    func execute(in dispatcher: Dispatcher, handler: @escaping Handler) {
        do {
            try dispatcher.execute(task: self) {
                self.handleResponse(withResponse: $0, handler: handler)
            }
        } catch {
            handler(.error(.badInput))
        }
    }

    private func handleResponse(withResponse response: Response, handler: @escaping Handler) {
        switch response {
        case .success(let data):
            guard let data = data else {
                handler(.error(.badContent))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Output.self, from: data)
                handler(.data(decoded))
            } catch {
                handler(.error(.badContent))
            }
        case .failure(let error):
            handler(.error(error))
        }
    }
}
