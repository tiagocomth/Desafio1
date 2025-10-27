# 📱 DESAFIO 1

Aplicativo desenvolvido em **SwiftUI** com arquitetura **MVVM**.  
O app permite adicionar, editar, excluir e organizar livros de leitura com base em **prioridade**, **data** e **status de conclusão**.

---

## 🚀 Tecnologias utilizadas
- **Swift 5**
- **SwiftUI**
- **Core Data**
- **Combine**
- **MVVM Architecture**

---

## 💡 Funcionalidades
- ✅ Adicionar novos Itens com título, descrição, data e prioridade  
- 🗑️ Excluir itens existentes  
- ✏️ Editar informações de um item  
- 🔍 Ordenar itens por data ou prioridade  
- 📅 Marcar itens como concluídos  
- 💾 Persistência local com Core Data

---


## ⚙️ Como rodar o projeto

1. **Clone o repositório:**
   git clone https://github.com/[seu-usuario]/Desafio1.git
   
2. **Abra o projeto no Xcode:**
    •    Clique duas vezes em Desafio1.xcodeproj (ou .xcworkspace, se houver)
    
3. **Configure o destino de execução:**
    •    Certifique-se de que o Target Deployment está definido para iOS 17 (26)
4.    **Selecione o simulador:**
    •    No menu superior, selecione o dispositivo iPhone 17 (ou equivalente)
5.    **Execute o app:**
    •    Pressione Cmd + R ou clique no botão ▶️ Run no Xcode
6.    **Pronto!**
    •    O aplicativo será iniciado no simulador do iPhone 17
    •    Agora você pode explorar e testar todas as funcionalidades

  ---


## ✅ O que foi mais fácil:

A parte mais simples foi implementar as UI com o Swiftui fica tudo mais fácil e prático,
facilitou bastante a criação das telas e a reatividade da interface com o estado dos dados.
Além disso, o MVVM deixou a organização do código mais clara e estruturada.

## ⚠️ O que foi mais difícil:

A parte mais desafiadora foi configurar o Core Data junto ao SwiftUI e implementar o CRUD.
Também foi um desafio trabalhar com protocolos e garantir que a persistência pudesse ser alterada facilmente,
graças ao código estar bem desacoplado.
