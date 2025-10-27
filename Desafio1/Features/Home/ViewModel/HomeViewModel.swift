//
//  HomeViewModel.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    @Published var showNewAddSheet: Bool = false
    @Published var books: [Book] = []
    @Published var recentlyCompletedIDs: Set<UUID> = []
    @Published var search: String = ""
    @Published var sortOption: SortOption = .date
    @Published var booktoEdit: Book? = nil

    var persistenceManager: any PersistenceManaging
    
    var filteredBooks: [Book] {
        var result = books.filter { !$0.isCompleted || recentlyCompletedIDs.contains($0.id) }

        if !search.isEmpty {
            result = result.filter { $0.title.localizedStandardContains(search) }
        }

        switch sortOption {
        case .date:
            result.sort { $0.date > $1.date }
        case .priority:
            result.sort { $0.priority.rawValue < $1.priority.rawValue }
        }

        return result
    }
    
    init(persistenceManager: some PersistenceManaging) {
        self.persistenceManager = persistenceManager
    }

    func fetchBooks(){
        do{
            books = try persistenceManager.fetchAll()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteBook(offsets: IndexSet) {
        offsets.forEach { index in
            let book = books[index]
            do{
                try persistenceManager.delete(book)
                books.remove(atOffsets: offsets)
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func toggleCompleted(for book: Book) {
        guard let index = books.firstIndex(of: book) else { return }
        
        withAnimation(.easeOut(duration: 0.3)) {
            books[index].isCompleted.toggle()
            recentlyCompletedIDs.insert(books[index].id)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            do {
                self.recentlyCompletedIDs.remove(self.books[index].id)
                try self.persistenceManager.update(self.books[index])
            } catch {
                
            }
        }
    }
    
    func orderByDate() {
        sortOption = .date
    }
    
    func orderByPriority() {
        sortOption = .priority
    }
    
    func createAddItemViewModel(book: Book) -> AddItemViewModel {
        let viewModel =  AddItemViewModel(persistenceManager: persistenceManager)
        viewModel.book = book
        return viewModel
    }
}
