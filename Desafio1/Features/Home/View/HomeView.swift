//
//  ContentView.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if viewModel.filteredBooks.isEmpty {
                ListEmptyView()
            } else {
                List{
                    ForEach(viewModel.filteredBooks) { book in
                        Button {
                            viewModel.booktoEdit = book
                        } label: {
                            BookRowView(book: book) {
                                viewModel.toggleCompleted(for: book)
                            }
                            .transition(.opacity.combined(with: .move(edge: .trailing)))
                            .animation(.easeInOut(duration: 0.3), value: viewModel.filteredBooks)
                        }
                    }
                    .onDelete(perform: viewModel.deleteBook)
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            }

        }
        .onAppear{
            viewModel.fetchBooks()
        }
        .sheet(item: $viewModel.booktoEdit) { book in
            AddItemView(viewModel: viewModel.createAddItemViewModel(book: book))
                .presentationDetents([.medium])
                .onDisappear {
                    withAnimation(.spring()) {
                        viewModel.fetchBooks()
                    }
            }
        }
        
        .sheet(isPresented: $viewModel.showNewAddSheet) {
            AddItemView(viewModel: AddItemViewModel(persistenceManager: viewModel.persistenceManager))
                .presentationDetents([.medium])
                .onDisappear {
                    withAnimation(.spring()) {
                        viewModel.fetchBooks()
                    }
                }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {

                AddButton {
                    viewModel.showNewAddSheet = true
                }
            }
            ToolbarItem(placement: .secondaryAction) {
                Menu {
                    Button("Data", action: viewModel.orderByDate)
                    
                    Button("Prioridade", action: viewModel.orderByPriority)
                    
                } label: {
                    Text("Ordenar por")
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(.black)


            }
        }
        .navigationTitle("Lista")
        .searchable(text: $viewModel.search, prompt: "Buscar")
        .padding()
    }
    
}

