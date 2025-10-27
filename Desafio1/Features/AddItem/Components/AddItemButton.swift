//
//  AddButton.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 26/10/25.
//

import SwiftUI

struct AddItemButton: View {
    var action: () -> Void
    var text: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(width: 150, height: 50)
                .background(Color.green.opacity(0.8))
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
    }    }
}

#Preview {
    AddItemButton(action: {}, text: "teste")
}
