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
    @State private var showWelcome = true

    var body: some Scene {
        WindowGroup {
            Group {
                if showWelcome {
                    ZooWelcomeView {
                        withAnimation(.easeInOut(duration: 0.45)) {
                            showWelcome = false
                        }
                    }
                } else {
                    MainView()
                }
            }
            .tint(ZooTheme.primary)
        }
    }
}

struct ZooWelcomeView: View {
    let onStart: () -> Void
    @State private var earthSpins = false

    var body: some View {
        GeometryReader { proxy in
            let fullWidth = proxy.size.width + proxy.safeAreaInsets.leading + proxy.safeAreaInsets.trailing
            let fullHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
            let earthSize = min(fullWidth * 1.10, 500)

            ZStack {
                Color.black
                    .ignoresSafeArea()

                Image("earth_star_zoo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: fullWidth, height: fullHeight)
                    .clipped()
                    .ignoresSafeArea()

                LinearGradient(
                    colors: [
                        Color.black.opacity(0.20),
                        Color.black.opacity(0.10),
                        Color.black.opacity(0.78)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                Image("earth_star_zoo_globe")
                    .resizable()
                    .scaledToFill()
                    .frame(width: earthSize, height: earthSize)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(earthSpins ? 360 : 0))
                    .animation(.linear(duration: 14).repeatForever(autoreverses: false), value: earthSpins)
                    .shadow(color: Color.blue.opacity(0.26), radius: 22, x: 0, y: 0)
                    .position(x: proxy.size.width / 2, y: fullHeight * 0.43)

                VStack(spacing: 24) {
                    Spacer()
                        .frame(height: max(proxy.size.height * 0.54, 360))
                    
                    VStack(spacing: 10) {
                        Text("Wildwood Learning Zoo")
                            .font(.largeTitle.weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.55), radius: 8, x: 0, y: 3)

                        Text("Explore animals, habitats, maps, and the people who care for the zoo.")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.opacity(0.86))
                            .frame(maxWidth: 420)
                            .shadow(color: .black.opacity(0.55), radius: 6, x: 0, y: 2)
                    }

                    Button(action: onStart) {
                        Text("Enter Zoo")
                            .font(.headline.weight(.bold))
                            .foregroundStyle(ZooTheme.primary)
                            .padding(.horizontal, 28)
                            .padding(.vertical, 14)
                            .background(ZooTheme.surface)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .shadow(color: Color.white.opacity(0.24), radius: 16, x: 0, y: 8)

                    Spacer(minLength: 32)
                }
                .padding(.horizontal, 28)
            }
        }
        .onAppear {
            earthSpins = true
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

    func animalHeroImageStyle() -> some View {
        self
            .frame(maxWidth: 420)
            .frame(height: 240)
            .frame(maxWidth: .infinity)
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

    func animalProfileMapInset() -> some View {
        self
            .padding(.horizontal, 14)
            .padding(.bottom, 8)
    }
}

struct AnimalProfileMap: View {
    private static let lastVisitedNameKey = "lastVisitedAnimalName"

    let animalName: String
    @State private var visitorName: String
    @State private var showExpandedMap = false

    @AppStorage(Self.lastVisitedNameKey) private var lastVisitedAnimalName = ZooMapLayout.entranceName
    private let mapHeight: CGFloat = 372

    init(animalName: String, animalCoordinate: CLLocationCoordinate2D) {
        self.animalName = animalName
        _visitorName = State(initialValue: Self.savedVisitorName())
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            InteractiveZooMap(
                animals: animalData,
                selectedAnimalName: animalName,
                visitorName: visitorName,
                compact: true
            )
            .frame(maxWidth: .infinity, minHeight: mapHeight)
            .contentShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .onTapGesture {
                showExpandedMap = true
            }

            Button {
                showExpandedMap = true
            } label: {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(ZooTheme.primary)
                    .padding(10)
                    .background(ZooTheme.surface.opacity(0.92))
                    .clipShape(Circle())
                    .shadow(color: ZooTheme.primary.opacity(0.16), radius: 6, x: 0, y: 3)
            }
            .padding(12)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(ZooTheme.primary.opacity(0.12), lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .sheet(isPresented: $showExpandedMap) {
            NavigationStack {
                InteractiveZooMap(
                    animals: animalData,
                    selectedAnimalName: animalName,
                    visitorName: visitorName
                )
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle("\(animalName) Map")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            showExpandedMap = false
                        }
                    }
                }
            }
            .presentationDetents([.large])
        }
        .onAppear {
            saveCurrentVisit()
        }
    }

    private func saveCurrentVisit() {
        lastVisitedAnimalName = animalName
    }

    private static func savedVisitorName() -> String {
        let defaults = UserDefaults.standard
        let savedName = defaults.string(forKey: lastVisitedNameKey) ?? ZooMapLayout.entranceName

        guard savedName == ZooMapLayout.entranceName
                || animalData.contains(where: { $0.name.caseInsensitiveCompare(savedName) == .orderedSame }) else {
            return ZooMapLayout.entranceName
        }

        return savedName
    }
}
