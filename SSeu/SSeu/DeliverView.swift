import SwiftUI
import MapKit

struct DeliveryLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: LocationType
    
    enum LocationType {
        case restaurant
        case delivery
        case user
    }
}

struct DeliverView: View {
    
    @State private var locations: [DeliveryLocation] = [
        DeliveryLocation(
            name: "Restaurante",
            coordinate: CLLocationCoordinate2D(latitude: -18.7256, longitude: -47.4986),
            type: .restaurant
        ),
        DeliveryLocation(
            name: "Entregador",
            coordinate: CLLocationCoordinate2D(latitude: -18.7246, longitude: -47.4976),
            type: .delivery
        ),
        DeliveryLocation(
            name: "Você",
            coordinate: CLLocationCoordinate2D(latitude: -18.7236, longitude: -47.4966),
            type: .user
        )
    ]
    
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -18.7256, longitude: -47.4986),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    @State private var estimatedTime: Int = 15
    @State private var isExpanded: Bool = false
    
    
    var body: some View {
        ZStack (alignment: .bottom){
            
            //barra superior
            VStack {
                HStack {
                    Button(action: {
                        print("Botão esquerdo pressionado")
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("Entrega")
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
                
                
                
                Map(position: $cameraPosition) {
                    
                    ForEach(locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(annotationColor(for: location.type))
                                        .frame(width: 40, height: 40)
                                    
                                    Image(systemName: annotationIcon(for: location.type))
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                }
                            
                            }
                        }
                    }
                    
                }.ignoresSafeArea(edges: .horizontal)
                 .frame(maxHeight: .infinity)
                    
                VStack {
                    HStack(spacing: 0) {
                        ForEach(["Busca", "Entrega", "Carrinho"], id: \.self) { item in
                            VStack(spacing: 4) {
                                Image(systemName: tabIcon(for: item))
                                    .font(.system(size: 22))
                                Text(item)
                                    .font(.caption)
                            }
                            .foregroundColor(item == "Entrega" ? .red : .gray)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
                }}
        }
    }
    
    
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
    
    
    func annotationColor(for type: DeliveryLocation.LocationType) -> Color {
        switch type {
        case .restaurant:
            return .blue
        case .delivery:
            return .red
        case .user:
            return .green
        }
    }
    
    
    func annotationIcon(for type: DeliveryLocation.LocationType) -> String {
        switch type {
        case .restaurant:
            return "fork.knife"
        case .delivery:
            return "bicycle"
        case .user:
            return "person.fill"
        }
    }
}
    
    
    #Preview {
        DeliverView()
    }
