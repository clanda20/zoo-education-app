//
//  ZooApp.swift
//  Zoo
//
//  Created by christian landa on 11/27/23.
//

import SwiftUI
import MapKit

@main
struct ZooApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .tint(ZooTheme.primary)
        }
    }
}

enum ZooTheme {
    static let background = Color(red: 0.97, green: 0.96, blue: 0.92)
    static let surface = Color(red: 1.00, green: 0.99, blue: 0.95)
    static let surfaceAlt = Color(red: 0.94, green: 0.93, blue: 0.88)
    static let primary = Color(red: 0.12, green: 0.32, blue: 0.23)
    static let secondary = Color(red: 0.16, green: 0.49, blue: 0.45)
    static let warmAccent = Color(red: 0.78, green: 0.38, blue: 0.18)
    static let goldenAccent = Color(red: 0.86, green: 0.66, blue: 0.25)
    static let ink = Color(red: 0.10, green: 0.16, blue: 0.13)
    static let mutedInk = Color(red: 0.38, green: 0.45, blue: 0.40)
    static let keeperBand = Color(red: 0.89, green: 0.95, blue: 0.86)
    static let adminBand = Color(red: 0.93, green: 0.90, blue: 0.98)
    static let volunteerBand = Color(red: 0.86, green: 0.95, blue: 0.97)
    static let keeperAccent = Color(red: 0.36, green: 0.63, blue: 0.34)
    static let adminAccent = Color(red: 0.54, green: 0.45, blue: 0.75)
    static let volunteerAccent = Color(red: 0.30, green: 0.62, blue: 0.72)

    static func parkColor(for location: String) -> Color {
        switch location {
        case "African Park": return Color(red: 0.87, green: 0.77, blue: 0.62)
        case "Amazonian Park": return Color(red: 0.58, green: 0.88, blue: 0.65)
        case "American Park": return Color(red: 0.98, green: 0.70, blue: 0.68)
        case "Asian Park": return Color(red: 0.96, green: 0.88, blue: 0.40)
        case "Ocean Park": return Color(red: 0.50, green: 0.80, blue: 0.94)
        case "Australian Park": return Color(red: 0.70, green: 0.68, blue: 0.90)
        default: return surfaceAlt
        }
    }

    static func parkBorderColor(for location: String) -> Color {
        switch location {
        case "African Park": return Color(red: 0.62, green: 0.44, blue: 0.27)
        case "Amazonian Park": return Color(red: 0.24, green: 0.58, blue: 0.32)
        case "American Park": return Color(red: 0.72, green: 0.30, blue: 0.27)
        case "Asian Park": return Color(red: 0.70, green: 0.56, blue: 0.12)
        case "Ocean Park": return Color(red: 0.18, green: 0.48, blue: 0.66)
        case "Australian Park": return Color(red: 0.42, green: 0.36, blue: 0.68)
        default: return mutedInk
        }
    }
}

extension View {
    func zooScreenStyle() -> some View {
        self
            .background(ZooTheme.background.ignoresSafeArea())
            .foregroundStyle(ZooTheme.ink)
            .tint(ZooTheme.primary)
    }

    func zooListStyle() -> some View {
        self
            .scrollContentBackground(.hidden)
            .background(ZooTheme.background.ignoresSafeArea())
            .tint(ZooTheme.primary)
    }

    func zooCardStyle(
        background: Color = ZooTheme.surface,
        border: Color = ZooTheme.surfaceAlt
    ) -> some View {
        self
            .padding(12)
            .background(background)
            .overlay {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(border.opacity(0.42), lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .shadow(color: ZooTheme.primary.opacity(0.10), radius: 8, x: 0, y: 4)
    }

    func zooParkChip(location: String) -> some View {
        self
            .fontWeight(.bold)
            .foregroundStyle(ZooTheme.parkBorderColor(for: location))
            .padding(.horizontal, 13)
            .padding(.vertical, 5)
            .background(ZooTheme.surface.opacity(0.88))
            .overlay {
                Capsule()
                    .stroke(ZooTheme.parkBorderColor(for: location).opacity(0.30), lineWidth: 1)
            }
            .clipShape(Capsule())
    }

    func zooParkButton(location: String) -> some View {
        self
            .buttonStyle(.borderedProminent)
            .tint(ZooTheme.surface.opacity(0.88))
            .foregroundStyle(ZooTheme.parkBorderColor(for: location))
            .overlay {
                Capsule()
                    .stroke(ZooTheme.parkBorderColor(for: location).opacity(0.30), lineWidth: 1)
            }
            .clipShape(Capsule())
    }

    func zooSectionHeader(accent: Color) -> some View {
        self
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(ZooTheme.primary)
            .padding(.horizontal, 18)
            .padding(.vertical, 6)
            .background(ZooTheme.surface.opacity(0.82))
            .overlay {
                Capsule()
                    .stroke(accent.opacity(0.25), lineWidth: 1)
            }
            .clipShape(Capsule())
    }
}

struct AnimalProfileMap: View {
    private static let lastVisitedNameKey = "lastVisitedAnimalName"
    private static let lastVisitedLatitudeKey = "lastVisitedAnimalLatitude"
    private static let lastVisitedLongitudeKey = "lastVisitedAnimalLongitude"
    private static let zooEntranceName = "Zoo Entrance"
    private static let zooEntranceCoordinate = CLLocationCoordinate2D(latitude: 33.099200, longitude: -117.000200)

    let animalName: String
    let animalCoordinate: CLLocationCoordinate2D

    @State private var position: MapCameraPosition
    @State private var visitorCoordinate: CLLocationCoordinate2D
    @State private var visitorName: String

    @AppStorage(Self.lastVisitedNameKey) private var lastVisitedAnimalName = Self.zooEntranceName
    @AppStorage(Self.lastVisitedLatitudeKey) private var lastVisitedLatitude = 0.0
    @AppStorage(Self.lastVisitedLongitudeKey) private var lastVisitedLongitude = 0.0

    init(animalName: String, animalCoordinate: CLLocationCoordinate2D) {
        self.animalName = animalName
        self.animalCoordinate = animalCoordinate

        let visitor = Self.savedVisitor()
        let region = Self.routeRegion(from: visitor.coordinate, to: animalCoordinate)

        _position = State(initialValue: .region(region))
        _visitorCoordinate = State(initialValue: visitor.coordinate)
        _visitorName = State(initialValue: visitor.name)
    }

    var body: some View {
        Map(position: $position, interactionModes: [.pan, .zoom, .rotate]) {
            Marker("You: \(visitorName)", systemImage: "figure.walk", coordinate: visitorCoordinate)
                .tint(ZooTheme.secondary)

            ForEach(animalData) { animal in
                let coordinate = CLLocationCoordinate2D(latitude: animal.latitude, longitude: animal.longitude)

                Annotation(animal.name, coordinate: coordinate) {
                    if isCurrentAnimal(animal) {
                        ProfileAnimalMapMarker(animalName: animal.name, isCurrent: true)
                    } else {
                        NavigationLink(destination: AnimalDetail(animal: animal)) {
                            ProfileAnimalMapMarker(animalName: animal.name, isCurrent: false)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

            MapPolyline(coordinates: [visitorCoordinate, animalCoordinate])
                .stroke(
                    ZooTheme.warmAccent,
                    style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [8, 6])
                )
        }
        .mapControls {
            MapCompass()
            MapScaleView()
        }
        .frame(maxWidth: .infinity, minHeight: 340)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(ZooTheme.primary.opacity(0.12), lineWidth: 1)
        }
        .onAppear {
            position = .region(Self.routeRegion(from: visitorCoordinate, to: animalCoordinate))
            saveCurrentVisit()
        }
    }

    private func isCurrentAnimal(_ animal: ZooAnimals) -> Bool {
        animal.name.caseInsensitiveCompare(animalName) == .orderedSame
    }

    private func saveCurrentVisit() {
        lastVisitedAnimalName = animalName
        lastVisitedLatitude = animalCoordinate.latitude
        lastVisitedLongitude = animalCoordinate.longitude
    }

    private static func savedVisitor() -> (name: String, coordinate: CLLocationCoordinate2D) {
        let defaults = UserDefaults.standard
        let hasSavedLatitude = defaults.object(forKey: lastVisitedLatitudeKey) != nil
        let hasSavedLongitude = defaults.object(forKey: lastVisitedLongitudeKey) != nil

        guard hasSavedLatitude, hasSavedLongitude else {
            return (zooEntranceName, zooEntranceCoordinate)
        }

        let savedCoordinate = CLLocationCoordinate2D(
            latitude: defaults.double(forKey: lastVisitedLatitudeKey),
            longitude: defaults.double(forKey: lastVisitedLongitudeKey)
        )

        guard CLLocationCoordinate2DIsValid(savedCoordinate),
              savedCoordinate.latitude != 0 || savedCoordinate.longitude != 0,
              isInsideZoo(savedCoordinate) else {
            return (zooEntranceName, zooEntranceCoordinate)
        }

        let savedName = defaults.string(forKey: lastVisitedNameKey) ?? zooEntranceName
        return (savedName, savedCoordinate)
    }

    private static func isInsideZoo(_ coordinate: CLLocationCoordinate2D) -> Bool {
        (33.095...33.1025).contains(coordinate.latitude)
        && (-117.001...(-116.994)).contains(coordinate.longitude)
    }

    private static func routeRegion(from visitorCoordinate: CLLocationCoordinate2D, to animalCoordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
        let latitudeDistance = abs(visitorCoordinate.latitude - animalCoordinate.latitude)
        let longitudeDistance = abs(visitorCoordinate.longitude - animalCoordinate.longitude)
        let center = CLLocationCoordinate2D(
            latitude: (visitorCoordinate.latitude + animalCoordinate.latitude) / 2,
            longitude: (visitorCoordinate.longitude + animalCoordinate.longitude) / 2
        )

        return MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(
                latitudeDelta: max(latitudeDistance * 1.8, 0.0012),
                longitudeDelta: max(longitudeDistance * 1.8, 0.0012)
            )
        )
    }
}

private struct ProfileAnimalMapMarker: View {
    let animalName: String
    let isCurrent: Bool

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(animalName.lowercased().filter { $0 != " " })
                .resizable()
                .scaledToFit()
                .padding(5)
                .frame(width: isCurrent ? 58 : 46, height: isCurrent ? 58 : 46)
                .background(ZooTheme.surface.opacity(0.94))
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(isCurrent ? ZooTheme.warmAccent : ZooTheme.primary.opacity(0.28), lineWidth: isCurrent ? 3 : 1)
                }
                .shadow(color: ZooTheme.primary.opacity(0.18), radius: 5, x: 0, y: 2)

            if isCurrent {
                Image(systemName: "mappin.circle.fill")
                    .font(.title3)
                    .foregroundStyle(ZooTheme.warmAccent)
                    .background(ZooTheme.surface.clipShape(Circle()))
            }
        }
    }
}
