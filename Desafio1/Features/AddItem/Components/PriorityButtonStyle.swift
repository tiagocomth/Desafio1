//
//  PriorityButtonStyle.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 23/10/25.
//

import Foundation
import SwiftUI

struct PriorityButtonStyle: ViewModifier {
    
    let priority: Priority
    let selectPriority: Priority
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(selectPriority == priority ? .white : priority.color)
            .font(.system(size: 24))
            .frame(width: 40, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(selectPriority == priority ? priority.color : Color.clear)
                    .stroke(priority.color, lineWidth: 2)
            )

    }
}
