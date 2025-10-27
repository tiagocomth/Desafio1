//
//  ListEmptyView.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 26/10/25.
//

import SwiftUI


struct ListEmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "tray")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray.opacity(0.4))
            
            Text("Nenhum item por aqui :(")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.gray)
            
            Text("Toque no botão para adicionar um novo item!")
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(.gray.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    ListEmptyView()
}
