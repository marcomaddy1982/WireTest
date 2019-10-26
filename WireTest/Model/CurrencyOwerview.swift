//
//  CurrencyOwerview.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import Foundation
import CoreData

public struct CurrencyOwerview: Decodable, Equatable {
    public let currencies: [String: Float]
    public let date: String
    public let base: String

    private enum CodingKeys: String, CodingKey {
        case currencies = "rates"
        case date
        case base
    }
}

public final class Currency: NSManagedObject {
    @NSManaged public var name: String

    public static func insert(currency: String, in managedContext: NSManagedObjectContext) {
        let currencyEntity = NSEntityDescription.entity(forEntityName: "Currency", in: managedContext)!
        let currencyObj = NSManagedObject(entity: currencyEntity, insertInto: managedContext)
        currencyObj.setValue(currency, forKey: "name")
    }

    public static func fetch(for searchText: String, in managedContext: NSManagedObjectContext) -> [Currency] {
        let fetchRequest = NSFetchRequest<Currency>(entityName: "Currency")
        fetchRequest.predicate = !searchText.isEmpty
            ? NSPredicate(format: "name contains[c] %@", searchText)
            : nil
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        if let results = try? managedContext.fetch(fetchRequest) {
            return results
        }

        return []
    }
}
