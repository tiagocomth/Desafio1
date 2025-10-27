//
//  GrayTextField.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 26/10/25.
//

import SwiftUI

struct GrayTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(placeholder)
            TextField(placeholder, text: $text)
                .roundedTextFieldStyle()
        })
    }
}

#Preview {
    @Previewable @State var text: String = ""
    GrayTextField(text: $text, placeholder: "teste" )
}
