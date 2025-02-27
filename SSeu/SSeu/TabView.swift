//
//  TabView.swift
//  SSeu
//
//  Created by Turma01-23 on 27/02/25.
//

import SwiftUI

struct MyTabView: View {
    @State private var selectedTab = "Busca"
    var body: some View {
        TabView(selection: $selectedTab) {
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Busca")
                    }
                }
                .tag("Busca")
            
            DeliverView(goBack: {
            })
            .tabItem {
                VStack {
                    Image(systemName: "safari")
                    Text("Entrega")
                }
            }
            .tag("Entrega")
            
            DeliverView(goBack: {
            })
            .tabItem {
                VStack {
                    Image(systemName: "cart")
                    Text("Carrinho")
                }
            }
            .tag("Carrinho")
        }
        .accentColor(.red)
    }
}



#Preview {
    MyTabView()
}
