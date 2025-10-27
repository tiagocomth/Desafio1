//
//  AddItemViewModel.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import Foundation
import Combine

class AddItemViewModel: ObservableObject {
    @Published var priority: Priority = .veryLow
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var date: Date = Date()
    @Published var isCompleted: Bool = false
    @Published var book: Book?
    
    private var persistenceManager: any PersistenceManaging
    
    init(persistenceManager: some PersistenceManaging) {
        self.persistenceManager = persistenceManager
    }
    
    func addBook() {
        let newBook = Book(id: UUID(), title: title, date: Date(), description: description, priority: priority, isCompleted: isCompleted)
        
        do{
           try persistenceManager.save(newBook)
        } catch {
            print(error.localizedDescription)

        }
    }
    
    func deleteBook(_ book: Book) {
        do{
            try persistenceManager.delete(book)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func isEdit() {
        guard let book else { return }
        self.title = book.title
        self.description = book.description
        self.date = book.date
        self.priority = book.priority
        self.isCompleted = book.isCompleted
    }
    
    func updateBook() {
        guard let book else { return }
        let updatedBook = Book(id: book.id, title: title, date: date, description: description, priority: priority, isCompleted: isCompleted)
        
        do{
            try persistenceManager.update(updatedBook)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveBook(){
        if book != nil {
            updateBook()
            print("update")
        } else {
            addBook()
            print("adicionado")
        }
    }
}
