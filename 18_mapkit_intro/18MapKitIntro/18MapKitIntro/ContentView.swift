//
//  ContentView.swift
//  18MapKitIntro
//
//  Created by Balázs Képli on 9/8/25.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    )
    var body: some View {
        //        VStack {
        //            Map(position: $position)
        //                .mapStyle(.hybrid)
        //                .onMapCameraChange {CameraChange in
        //                    print(CameraChange.region)
        //                }
        //
        //            HStack {
        //                Button("Paris") {
        //                    position = MapCameraPosition.region(
        //                        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        //                    )
        //                }
        //
        //                Button("Tokyo") {
        //                    position = MapCameraPosition.region(
        //                        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        //                    )
        //                }
        //            }
        //        }
        
        VStack {
            //            Map {
            //                ForEach(locations) { location in
            //                    //Marker(location.name, coordinate: location.coordinate)
            //                    Annotation(location.name, coordinate: location.coordinate) {
            //                        Text(location.name)
            //                            .font(.headline)
            //                            .padding()
            //                            .background(.blue)
            //                            .foregroundStyle(.white)
            //                            .clipShape(.capsule)
            //                    }
            //                    .annotationTitles(.hidden)
            //                }
            //            }
            
            MapReader { proxy in
                Map()
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
            }
            
            HStack {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                    )
                }
                
                Button("Tokyo") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                    )
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
