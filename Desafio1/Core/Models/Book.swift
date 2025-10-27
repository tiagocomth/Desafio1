//
//  Book.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: UUID
    let title: String
    let date: Date
    let description: String
    let priority: Priority
    var isCompleted: Bool
}
