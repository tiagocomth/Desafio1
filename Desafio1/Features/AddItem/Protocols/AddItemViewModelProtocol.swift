//
//  AddItemViewProtocol.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import Foundation

protocol AddItemViewModelProtocol {
    var title: String { get set}
    var description: String { get set}
    var date: Date { get set}
    var priority: Priority { get set}
    
    func addBook()
}
