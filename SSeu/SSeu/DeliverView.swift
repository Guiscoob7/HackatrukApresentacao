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
    
    var goBack: () -> Void
    
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
        
        //barra superior
        VStack {
            VStack{
                HStack {
                    Button(action: {
                        goBack()
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
                    
                }
                .padding(.horizontal)
                .background(Color.red)
                
                
                Map(position: $cameraPosition) {
                    
                    ForEach(locations) { location in
                        // Não mostrar nome para o entregador
                        if location.type == .delivery {
                            Annotation("", coordinate: location.coordinate) {
                                ZStack {
                                    Circle()
                                        .fill(annotationColor(for: location.type))
                                        .frame(width: 40, height: 40)
                                    
                                    Image(systemName: annotationIcon(for: location.type))
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                }
                            }
                        } else {
                            // Mostrar nome para os outros tipos
                            Annotation(location.name, coordinate: location.coordinate) {
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
                    
                }.padding(.top, -25)
            }
            
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
    DeliverView(goBack: {
    })
}
