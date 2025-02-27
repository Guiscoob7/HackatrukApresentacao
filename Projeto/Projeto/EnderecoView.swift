import SwiftUI

struct EnderecoView: View {
    
    @State var bairro: String = ""
    @State var rua: String = ""
    @State var num: Int = 0
    @State var cpf: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    
                    Spacer()
                    
                    // Seção de endereço
                    ZStack{
                        HStack {
                            Text("Endereço")
                                .font(.system(size: 25, weight: .bold, design: .serif))
                                .foregroundStyle(.black)
                                .padding(.top).padding(.leading)
                            Spacer()
                        }
                        
                    }
                    Divider().background(.black)
                    // Formulários para inserir os dados do endereço
                    VStack {
                        HStack {
                            Text("Bairro: ")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                        }
                        
                        HStack {
                            TextField("Bairro: ", text: $bairro)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Spacer()
                        }.padding(.leading).shadow(radius: 3)
                        
                        HStack {
                            Text("Rua: ")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                        }
                        
                        HStack {
                            TextField("Rua: ", text: $rua)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Spacer()
                        }.padding(.leading).shadow(radius: 3)
                        
                        HStack {
                            Text("Número: ")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                        }
                        
                        HStack {
                            TextField("Número: ", value: $num, format: .number)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Spacer()
                        }.padding(.leading).shadow(radius: 3)
                        
                        HStack {
                            Text("CPF: ")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                        }
                        
                        HStack {
                            TextField("Cpf: ", text: $cpf)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Spacer()
                        }.padding(.leading).padding(.bottom).shadow(radius: 3)
                        
                        // Navegação para a próxima página
                        NavigationLink(destination: ContentView(dados: Dados(rua: rua, bairro: bairro, numero: num, cpf: cpf))) {
                            Text("Ir para página de pagamento")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .frame(width: 330, height: 60)
                                .background(.vermelhoVivo)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
    }
}
    
    #Preview {
        EnderecoView()
    }
