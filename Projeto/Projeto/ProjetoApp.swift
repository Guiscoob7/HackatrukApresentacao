//
//  ProjetoApp.swift
//  Projeto
//
//  Created by Turma01-24 on 25/02/25.
//

import SwiftUI

@main
struct ProjetoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dados: Dados(rua: "a", bairro: "a", numero: 2, cpf: ""))
        }
    }
}
