//
//  BookRowView.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 22/10/25.
//

import SwiftUI

struct BookRowView: View {
    var book: Book
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
                
            HStack{
                Image(systemName: book.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 10)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        action()
                    }
                
                VStack(alignment: .leading){
                    Text(book.title)
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundStyle(.background)
                    Text(book.description)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text(book.date, style: .time)
                    .foregroundStyle(.secondary)
                    .offset(y: 24)
                    .padding(10)
                

            }

        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding(10)
        .background(book.priority.color.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    BookRowView(book: Book(id: UUID(), title: "Name", date: Date(), description: "Description", priority: .medium, isCompleted: false), action: {
        
    } )
}
