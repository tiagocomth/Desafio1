//
//  AddButtonComponent.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import SwiftUI

struct AddButton: View {
    
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .tint(Color(.white))
                .font(.system(size: 15, weight: .bold))
                .frame(width: 30, height: 30)
                //.background(Color(.secondarySystemBackground))
                .cornerRadius(25)
        }
    }
}

#Preview {
    AddButton()
}
