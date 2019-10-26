//
//  CoreDataManager.swift
//  WireTest
//
//  Created by Marco Maddalena on 26.10.19.
//  Copyright © 2019 Wire. All rights reserved.
//

import CoreData

// MARK: - CoreDataManager

struct CoreDataManager {

    // MARK: Properties

    private let model: NSManagedObjectModel
    internal let coordinator: NSPersistentStoreCoordinator
    private let modelURL: URL
    internal let dbURL: URL
    let context: NSManagedObjectContext
    let privateContext: NSManagedObjectContext

    // MARK: Initializers

    init?(modelName: String) {

        // Assumes the model is in the main bundle
        guard let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd") else {
            print("Unable to find \(modelName)in the main bundle")
            return nil
        }
        self.modelURL = modelURL

        // Try to create the model from the URL
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            print("unable to create a model from \(modelURL)")
            return nil
        }
        self.model = model

        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.persistentStoreCoordinator = coordinator
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = privateContext

        // Add a SQLite store located in the documents folder
        let fm = FileManager.default
        guard let docUrl = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Unable to reach the documents folder")
            return nil
        }

        self.dbURL = docUrl.appendingPathComponent("model.sqlite")

        do {
            try addStoreCoordinator(NSInMemoryStoreType, configuration: nil, storeURL: dbURL, options: nil)
        } catch {
            print("unable to add store at \(dbURL)")
        }
    }

    // MARK: Utils

    func addStoreCoordinator(_ storeType: String, configuration: String?, storeURL: URL, options : [NSObject:AnyObject]?) throws {

        try coordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: dbURL, options: options)
    }
}

// MARK: - CoreDataManager (Save Data)

extension CoreDataManager {
    func saveContext() throws {
        if privateContext.hasChanges {
            try privateContext.save()
        }
    }
}
