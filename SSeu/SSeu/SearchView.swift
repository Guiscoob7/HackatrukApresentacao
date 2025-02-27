import SwiftUI

struct CategoriaCardView: View {
    let emoji: String
    let nome: String
    @State private var colorIndex = 0
    var onTap: () -> Void
    
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
        .onTapGesture {
            onTap()
        }
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

// Views para cada tab
struct SearchView: View {
    @State private var termoBusca: String = ""
    @State private var showDeliverView = false
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
    
    private var categoriasFiltradas: [(nome: String, emoji: String)] {
        if termoBusca.isEmpty {
            return categorias
        } else {
            return categorias.filter { $0.nome.lowercased().contains(termoBusca.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack {
            if showDeliverView {
                DeliverView(goBack: {
                    showDeliverView = false
                })
            } else {
                mainView
            }
        }
        .navigationBarHidden(true)
    }
    
    var mainView: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Barra superior
                HStack {
                    
                    
                    
                    Spacer()
                    
                    Text("Busca")
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
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
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Categorias")
                            .font(.largeTitle)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        
                        if categoriasFiltradas.isEmpty {
                            Text("Nenhuma categoria encontrada")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                ForEach(categoriasFiltradas, id: \.nome) { categoria in
                                    CategoriaCardView(
                                        emoji: categoria.emoji,
                                        nome: categoria.nome,
                                        onTap: {
                                            showDeliverView = true
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 80)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
