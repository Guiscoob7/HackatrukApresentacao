import SwiftUI

struct CategoriaCardView: View {
    let emoji: String
    let nome: String
    @State private var colorIndex = 0
    
    private let colors: [Color] = [
        Color(.lightGray),
        Color.blue.opacity(0.2),
        Color.green.opacity(0.2),
        Color.yellow.opacity(0.2),
        Color.orange.opacity(0.2),
        Color.pink.opacity(0.2),
        Color.purple.opacity(0.2)
    ]
    
    var body: some View {
        HStack(spacing: 12) {
            Text(emoji).font(.title)
            Text(nome).font(.subheadline).foregroundColor(.black)
            Spacer()
        }
        .padding()
        .background(colors[colorIndex])
        .cornerRadius(10)
        .padding(.top, 1)
        .padding(.bottom, 1)
        .onAppear {
            startColorAnimation()
        }
    }
    
    
    private func startColorAnimation() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                colorIndex = (colorIndex + 1) % colors.count
            }
        }
        RunLoop.current.add(timer, forMode: .common)
    }
}

struct SearchView: View {
    @State private var termoBusca: String = ""
    @State private var categorias: [(nome: String, emoji: String)] = [
        ("Mercado", "🛒"),
        ("Farmácia", "💊"),
        ("Pet", "🐶"),
        ("Bebidas", "🍺"),
        ("Café", "☕️"),
        ("Marmita", "🥡"),
        ("Açaí", "🍨"),
        ("Vegetariano", "🥗"),
        ("Padaria", "🥖"),
        ("Sorvete", "🍦"),
        ("Sushi", "🍣"),
        ("Pizza", "🍕"),
        ("Hambúrguer", "🍔"),
        ("Churrasco", "🍖"),
        ("Salgados", "🥟"),
        ("Doces", "🍬"),
        ("Frutas", "🍎"),
        ("Legumes", "🥕"),
        ("Laticínios", "🥛"),
        ("Congelados", "🧊"),
        ("Orgânicos", "🌱"),
        ("Vegano", "🌿"),
        ("Massas", "🍝"),
        ("Sopas", "🍲"),
        ("Lanches", "🍿"),
        ("Chá", "🍵"),
        ("Vinhos", "🍷"),
        ("Cervejas", "🍻"),
        ("Enlatados", "🥫"),
        ("Temperos", "🧂"),
        ("Molhos", "🍶"),
        ("Grãos", "🌾"),
        ("Carnes", "🥩"),
        ("Peixes", "🐟"),
        ("Fitness", "💪"),
        ("Sem Glúten", "🚫🌾"),
        ("Sem Lactose", "🚫🥛"),
        ("Fast Food", "🍟"),
        ("Comida Asiática", "🍜"),
        ("Comida Mexicana", "🌮"),
        ("Comida Árabe", "🥙"),
        ("Comida Italiana", "🍝"),
        ("Comida Japonesa", "🍣"),
        ("Comida Brasileira", "🇧🇷"),
        ("Comida Caseira", "🍛"),
        ("Comida Fitness", "🥗"),
        ("Comida Infantil", "🍼"),
        ("Comida para Festas", "🎉"),
        ("Comida para Viagem", "✈️"),
        ("Comida para Pets", "🐾")
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    // Barra superior
                    HStack {
                        Button(action: {
                            print("Botão esquerdo pressionado")
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("Busca")
                            .font(.system(size:45))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Botão direito pressionado")
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 60)
                    .background(Color.red)
                    .ignoresSafeArea(.all, edges: .top)
                    

                    // Barra de busca
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Restaurante, item ou mercado", text: $termoBusca)
                            .font(.subheadline)
                        
                        if !termoBusca.isEmpty {
                            Button(action: {
                                termoBusca = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, -50)
                    
                    // Lista de categorias
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Categorias")
                                .font(.largeTitle)
                                .padding(.horizontal)
                                .padding(.top, 10)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                ForEach(categorias, id: \.nome) { categoria in
                                    CategoriaCardView(emoji: categoria.emoji, nome: categoria.nome)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 80)
                    }
                }
                
                // Barra de navegação inferior
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        ForEach(["Busca", "Entrega", "Carrinho"], id: \.self) { item in
                            VStack(spacing: 4) {
                                Image(systemName: tabIcon(for: item))
                                    .font(.system(size: 22))
                                Text(item)
                                    .font(.caption)
                            }
                            .foregroundColor(item == "Busca" ? .red : .gray)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
                }
            }
        }
    }
    
    // Função para retornar ícones com base no nome da aba
    func tabIcon(for tab: String) -> String {
        switch tab {
        case "Entrega":
            return "safari"
        case "Busca":
            return "magnifyingglass"
        case "Carrinho":
            return "cart"
        default:
            return "questionmark"
        }
    }
}

#Preview {
    SearchView()
}
