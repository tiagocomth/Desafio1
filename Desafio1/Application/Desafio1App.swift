//
//  Desafio1App.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import SwiftUI

@main
struct Desafio1App: App {
    let viewModel: HomeViewModel
    let coreDataManager: CoreDataPersistenceManager
    
    init() {
        coreDataManager = CoreDataPersistenceManager(modelName: "Desafio1")
        viewModel = HomeViewModel(persistenceManager: coreDataManager)

    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(viewModel: viewModel)
            }
        }
    }
}
