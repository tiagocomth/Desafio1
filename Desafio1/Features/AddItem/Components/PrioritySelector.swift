//
//  PrioritySelector.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 26/10/25.
//

import SwiftUI

struct PrioritySelector: View {
    
    @Binding var selectPriority: Priority
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Prioridade de leitura:")
            HStack{
                ForEach(Priority.allCases, id: \.self) { priority in
                    Button {
                        selectPriority = priority
                    } label: {
                        Text("\(priority.rawValue)")
                            .modifier(PriorityButtonStyle(priority: priority, selectPriority: selectPriority))


                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var priority: Priority = .low
    PrioritySelector(selectPriority: $priority, placeholder: "Selecione a prioridade")
}
