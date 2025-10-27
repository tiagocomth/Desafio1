//
//  HomeViewModelProtocol.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject, ObservableObject {
    var showNewAddSheet: Bool { get set }
    var books: [Book] { get set }
}
