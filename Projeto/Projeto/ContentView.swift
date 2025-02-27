import SwiftUI

struct Dados {
    var rua : String
    var bairro : String
    var numero : Int
    var cpf : String
}

struct ContentView: View {
    @State var boolButonN : Bool = false
    @State var boolButonS : Bool = false
    @State var boolButonPix : Bool = false
    @State var boolButonDinheiro : Bool = false
    @State var boolButonDebito : Bool = false
    @State var boolButonCredito : Bool = false

    @State var dados : Dados
    
    var body: some View {
        ScrollView(.vertical){
            VStack {
                
                
                VStack (alignment: .leading){
                    VStack (alignment: .leading){
                        Text("Confirmacao de endereco").font(.system(size: 20, weight: .bold)).padding(.bottom, 10)
                        
                        VStack (alignment: .leading){
                            Text("Rua: ")
                            
                            Text("\(dados.rua)").frame(width: 300, height: 40).background(.white)
                                .cornerRadius(10).shadow(color: .vermelhoclaro, radius: 3, x: 2, y: 2)
                                .multilineTextAlignment(.center)
                        }.padding(.bottom, 5)
                        
                        VStack(alignment: .leading) {
                            Text("Bairro:")
                            Text("\(dados.bairro)").frame(width: 300, height: 40).background(.white).cornerRadius(10).shadow(color: .vermelhoclaro, radius: 3, x: 2, y: 2)
                                .multilineTextAlignment(.center)
                        }.padding(.bottom, 5)
                        
                        VStack {
                            Text("Numero")
                            Text("\(dados.numero)").frame(width: 60, height: 35).background(.white).cornerRadius(10).shadow(color: .vermelhoclaro, radius: 3, x: 2, y: 2)
                                .multilineTextAlignment(.center)
                        }.padding(.bottom, 5)
                    }.padding(.bottom, 40)
                    
                    
                    

                    
                    Text("Resumo de valores: ").font(.system(size: 20, weight: .bold))
                    VStack (alignment: .leading){
                        HStack {
                            Text("Subtotal: ")
                        }.padding(.top, 10)
                        HStack {
                            Text("Taxa entrega: ")
                        }.padding(.top, 10)
                        HStack {
                            Text("Total: ")
                        }.padding(.top, 10)
                    }
                }.padding()
                
                VStack {
                    HStack{
                        Text("Formas de pagamentos: ").font(.system(size: 20, weight: .bold))
                        Spacer()
                    }.padding(.leading, 50)
                    
                    VStack (){
                        Button(action: {
                            boolButonPix.toggle()
                            boolButonDebito = false
                            boolButonCredito = false
                            boolButonDinheiro = false
                        }) {
                            HStack {
                                Text("PIX").foregroundStyle(boolButonPix ? Color.white : Color.black)
                                AsyncImage(url: URL(string: "https://geradornv.com.br/wp-content/themes/v1.34.7/assets/images/logos/pix/logo-pix-520x520.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 30, height: 30)
                            }
                            .frame(width: 300, height: 50)
                            .background(boolButonPix ? Color.vermelhoVivo : Color.white).cornerRadius(10)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        
                        Button(action: {
                            boolButonPix = false
                            boolButonDebito = false
                            boolButonCredito.toggle()
                            boolButonDinheiro = false
                        }) {
                            HStack {
                                Text("Cartão de credito").foregroundStyle(boolButonCredito ? Color.white : Color.black)
                                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/51/Elo_logo.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 30, height: 30)
                                
                                AsyncImage(url: URL(string: "https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 30)
                            }
                        }
                        .frame(width: 300, height: 50)
                        .background(boolButonCredito ? Color.vermelhoVivo : Color.white).cornerRadius(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Button(action: {
                            boolButonPix = false
                            boolButonDebito.toggle()
                            boolButonCredito = false
                            boolButonDinheiro = false
                        }) {
                            HStack {
                                Text("Cartão de debito").foregroundStyle(boolButonDebito ? Color.white : Color.black)
                                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/51/Elo_logo.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 30, height: 30)
                                
                                AsyncImage(url: URL(string: "https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 30)
                            }
                        }
                        .frame(width: 300, height: 50)
                        .background(boolButonDebito ? Color.vermelhoVivo : Color.white).cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Button(action: {
                            boolButonPix = false
                            boolButonDebito = false
                            boolButonCredito = false
                            boolButonDinheiro.toggle()
                        }) {
                            HStack {
                                Text("Dinheiro").foregroundStyle(boolButonDinheiro ? Color.white : Color.black)
                                AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpTiCxrQck3ncXk-_6H83-WAu89zvBX3hn3g&s")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 40, height: 30)
                            }
                        }
                        .frame(width: 300, height: 50)
                        .background(boolButonDinheiro ? Color.vermelhoVivo : Color.white).cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom, 30)
                }
                
         
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .shadow(color: .vermelhoclaro, radius: 3, x: 0, y: -7)
                    HStack {
                        HStack{
                            Image(systemName: "list.clipboard.fill").font(.system(size: 30))
                            VStack {
                                Text("CPF na nota? ")
                                Text("\(dados.cpf)").font(.system(size: 13))
                            }
                        }
                        Button(action: {
                            boolButonN.toggle()
                            boolButonS = false
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 70, height: 50)
                                    .tint(boolButonN ? Color.red : Color.grayButton)
                                    .cornerRadius(15)
                                Text("Sim").foregroundStyle(boolButonN ? Color.white : Color.black)
                            }
                        }
                        
                        Button(action: {
                            boolButonS.toggle()
                            boolButonN = false
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 70, height: 50)
                                    .tint(boolButonS ? Color.red : Color.grayButton)
                                    .cornerRadius(15)
                                Text("Não").foregroundStyle(boolButonS ? Color.white : Color.black)
                            }
                        }
                    }.frame(width: 400, height: 100)
                }
                VStack{
                    Button(action: {}) {
                        Text("Pagar")
                            .frame(width: 120, height: 50)
                            .foregroundStyle(.white)
                            .background(.red)
                            .cornerRadius(10)
                    }
                }.padding(.top, 10)
                
            }
        }
    }
}

#Preview {
    ContentView(dados: Dados(rua: "a", bairro: "a", numero: 2, cpf: ""))
}
