//
//  ZooMap.swift
//  Zoo
//
//  Created by christian landa on 11/30/23.
//

import SwiftUI
import MapKit

struct ZooMapView: View {
    // MARK: - PROPERTIES
    private let zooAnimals = AnimalLocation.loadAll()

    ///Setting up the Region, Coordinates, and Span of the Zoo Map.
    @State private var position: MapCameraPosition = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 33.098284, longitude: -116.999629)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return .region(mapRegion)
    }()

    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            Map(position: $position) {
                ForEach(zooAnimals) { animal in
                    Annotation(animal.name, coordinate: animal.location) {
                        if let animalDetail = animalDetail(for: animal) {
                            NavigationLink(destination: AnimalDetail(animal: animalDetail)) {
                                MapAnnotationView(location: animal)
                            }
                            .buttonStyle(.plain)
                        } else {
                            MapAnnotationView(location: animal)
                        }
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    private func animalDetail(for location: AnimalLocation) -> ZooAnimals? {
        animalData.first {
            $0.name.caseInsensitiveCompare(location.name) == .orderedSame
        }
    }
}

//#Preview {
struct ZooMapView_Previews: PreviewProvider{
    static var previews: some View {
        ZooMapView()
    }
}
