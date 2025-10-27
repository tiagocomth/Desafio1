//
//  AddItemView.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import SwiftUI

struct AddItemView: View {
    
    @ObservedObject var viewModel: AddItemViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20){
            VStack(alignment: .leading, spacing: 20) {

                GrayTextField(text: $viewModel.title, placeholder: "Titulo")
                
                GrayTextField(text: $viewModel.description, placeholder: "Descrição")
                
                PrioritySelector(selectPriority: $viewModel.priority, placeholder:  "Prioridade de leitura")
            }
            
            AddItemButton(action: {
                dismiss()
            }, text: (viewModel.book != nil) ? "Atualizar" : "Adicionar")

        .padding()

        }
        .onAppear{
            viewModel.isEdit()
        }
        .padding(.top, 50)
        Spacer()
    }
}

//#Preview {
//    AddItemView(viewModel: AddItemViewModel(persistenceManager: CoreDataPersistenceManager(modelName: "Desafio1")))
//}
