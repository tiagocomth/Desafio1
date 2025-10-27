//
//  CoreDataPersistenceManager.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 24/10/25.
//

import Foundation
import CoreData

final class CoreDataPersistenceManager {

    let container: NSPersistentContainer
    
    init(modelName: String){
        container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
}

extension CoreDataPersistenceManager: PersistenceManaging {
    
    func save(_ object: Book) throws {
        let newItem = BookEntity(context: container.viewContext)
        newItem.id = object.id
        newItem.title = object.title
        newItem.bookDescription = object.description
        newItem.date = object.date
        newItem.priority = Int16(object.priority.rawValue)
        
        try container.viewContext.save()
        
    }
    
    func update(_ object: Book) throws {
        let request: NSFetchRequest<BookEntity> = BookEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", object.id as CVarArg)
        
        if let result = try container.viewContext.fetch(request).first {
            result.title = object.title
            result.bookDescription = object.description
            result.priority = Int16(object.priority.rawValue)
            result.isCompleted = object.isCompleted
            
            if container.viewContext.hasChanges {
                try container.viewContext.save()
            }
        }
    }
    
    func fetchAll() throws -> [Book] {
        let request = BookEntity.fetchRequest()
        let result =  try container.viewContext.fetch(request)
        return result.map {
            Book(id: $0.id ?? UUID(),
                 title: $0.title ?? "",
                 date: $0.date ?? Date(),
                 description: $0.bookDescription ?? "",
                 priority: Priority(rawValue: Int($0.priority)) ?? .medium,
                 isCompleted: $0.isCompleted)
        }
    }
    
    func delete(_ object: Book) throws {
        let request: NSFetchRequest<BookEntity> = BookEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", object.id as CVarArg)
        
        if let result = try? container.viewContext.fetch(request).first {
            container.viewContext.delete(result)
            try container.viewContext.save()
        }
        
    }
    
}
