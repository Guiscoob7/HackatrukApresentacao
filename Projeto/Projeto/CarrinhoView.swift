//
//  carrinho.swift
//  ProjetoFinalCarrinho
//
//  Created by Turma01-15 on 25/02/25.
//

import SwiftUI

struct products : Identifiable{
    var id = UUID()
    var img : String
    var name : String
    var price : Float
}

var arrayProducts = [
    products(img: "https://diafoodservice.agilecdn.com.br/5721_1.jpg", name: "Leite Integral Leitíssimo 1L", price: 8.99),
    products(img: "https://images-americanas.b2w.io/produtos/3625162966/imagens/arroz-japones-grao-longo-1kg-momiji/3625162966_1_xlarge.jpg", name: "Arroz Japonês Momiji 5Kg", price: 80),
    products(img: "https://www.shutterstock.com/image-vector/fresh-organic-chicken-eggs-open-260nw-2267194353.jpg", name: "Pacote de Ovo, 12 unidades", price: 11.90),
    products(img: "https://comper.vteximg.com.br/arquivos/ids/207376-500-500/7896002302197.jpg?v=637788254474900000", name: "Pão de forma Pullman Artesano 500g", price: 14.99),
    products(img: "https://casaspedro.vteximg.com.br/arquivos/ids/194529-1000-1000/nozes-sem-pele-inteira-extra-clara.png?v=638635000275300000", name: "Nozes, 150g", price: 18),
    products(img: "https://apoioentrega.vteximg.com.br/arquivos/ids/848008/198302_0.png?v=638595088994030000", name: "Milho, 50g", price: 4),
    products(img: "https://www.galloportugal.com/wp-content/uploads/2024/02/Gallo_Classico_500ml_Garrafa_Extra_Virgem.png", name: "Azeite, 50g", price: 50),
    products(img: "https://www.galloportugal.com/wp-content/uploads/2024/02/Gallo_Classico_500ml_Garrafa_Extra_Virgem.png", name: "Azeite, 50g", price: 50),
    products(img: "https://www.galloportugal.com/wp-content/uploads/2024/02/Gallo_Classico_500ml_Garrafa_Extra_Virgem.png", name: "Azeite, 50g", price: 50),
    products(img: "https://www.galloportugal.com/wp-content/uploads/2024/02/Gallo_Classico_500ml_Garrafa_Extra_Virgem.png", name: "Azeite, 50g", price: 50),
    products(img: "https://www.galloportugal.com/wp-content/uploads/2024/02/Gallo_Classico_500ml_Garrafa_Extra_Virgem.png", name: "Azeite, 50g", price: 50)
    
]


struct CarrinhoView: View {
    
    @State var bairro : String = ""
    @State var rua : String = ""
    @State var num : Int = 0
    @State var cpf : Int = 0
    
    var body: some View {
        ScrollView{
            ZStack{
                Color(.white).ignoresSafeArea()
                
                VStack{
                    HStack{
                        Spacer()
                        Text ("S")
                            .font(.system(size: 40, weight: .bold, design: .serif))
                            .foregroundStyle(.red)
                        Text ("Seu")
                            .font(.system(size: 40, weight: .bold, design: .serif))
                            .foregroundStyle(.yellow)
                        Text ("Carrinho...")
                            .font(.system(size: 40, weight: .bold, design: .serif))
                            .foregroundStyle(.blue)
                        Spacer()
                    }.background(.gray).frame(width: .infinity, height: .infinity)
                    
                    Divider()
                        ForEach(arrayProducts){ e in
                            HStack{
                                AsyncImage(url: URL(string: e.img), content: { img in
                                    img.resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                    
                                }, placeholder: {
                                    Circle().fill(.gray)
                                        .frame(width: 120)
                                })
                                
                                VStack(alignment: .leading){
                                    Text(e.name)
                                        .font(.system(size: 18, weight: .bold, design: .serif))
                                        .foregroundStyle(.black)
                                    
                                    Text ("R$ \(e.price)")
                                        .font(.system(size: 18, weight: .bold, design: .serif))
                                        .foregroundStyle(.black)
                                        
                                }
                                
                                Spacer()
                                
                                Image( systemName: "plus.circle")
                                    .foregroundStyle(.black)
                                
                                Text ("1")
                                    .font(.system(size: 18, weight: .bold, design: .serif))
                                
                                Image( systemName: "minus.circle")
                                    .foregroundStyle(.black)
                                
                                Image( systemName: "trash.fill")
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                        }
                    Divider()
                    Spacer()
                    
                    
                    Text ("Ir para página de pagamento")
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .frame (width: 330, height: 60)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.top)
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    CarrinhoView()
}
