//
//  PersistenceManaging.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 25/10/25.
//

import Foundation

protocol PersistenceManaging {
    
    func save(_ object: Book) throws
    func fetchAll() throws -> [Book]
    func delete(_ object: Book) throws
    func update(_ object: Book) throws 
}
