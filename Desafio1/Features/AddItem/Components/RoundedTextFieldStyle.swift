//
//  RoundedTextFieldStyle.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 23/10/25.
//

import Foundation
import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .textFieldStyle(.plain)
            .frame(width: 350, height: 45)
            .overlay {
                RoundedRectangle(cornerRadius: 10).opacity(0.1)
            }
    }
}

extension View {
    func roundedTextFieldStyle() -> some View {
        textFieldStyle(RoundedTextFieldStyle())
    }
}
