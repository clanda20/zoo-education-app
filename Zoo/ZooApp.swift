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
    @State private var starPhase = 0

    private let stars: [WelcomeStar] = [
        .init(x: 0.10, y: 0.15, size: 2.0, group: 0), .init(x: 0.23, y: 0.09, size: 1.2, group: 1),
        .init(x: 0.36, y: 0.19, size: 1.6, group: 2), .init(x: 0.58, y: 0.10, size: 2.4, group: 0),
        .init(x: 0.79, y: 0.17, size: 1.5, group: 1), .init(x: 0.91, y: 0.08, size: 2.0, group: 2),
        .init(x: 0.14, y: 0.37, size: 1.4, group: 1), .init(x: 0.31, y: 0.31, size: 2.2, group: 2),
        .init(x: 0.47, y: 0.43, size: 1.3, group: 0), .init(x: 0.68, y: 0.35, size: 1.9, group: 1),
        .init(x: 0.86, y: 0.46, size: 1.4, group: 2), .init(x: 0.18, y: 0.67, size: 2.1, group: 0),
        .init(x: 0.39, y: 0.75, size: 1.5, group: 1), .init(x: 0.62, y: 0.66, size: 1.8, group: 2),
        .init(x: 0.82, y: 0.78, size: 2.2, group: 0), .init(x: 0.93, y: 0.61, size: 1.2, group: 1)
    ]

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                LinearGradient(
                    colors: [
                        Color.black,
                        Color(red: 0.02, green: 0.04, blue: 0.10),
                        Color(red: 0.00, green: 0.01, blue: 0.04)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ForEach(stars) { star in
                    Circle()
                        .fill(Color.white.opacity(star.group == starPhase ? 1.0 : 0.20))
                        .frame(
                            width: star.group == starPhase ? star.size * 1.45 : star.size,
                            height: star.group == starPhase ? star.size * 1.45 : star.size
                        )
                        .position(x: proxy.size.width * star.x, y: proxy.size.height * star.y)
                        .animation(
                            .easeInOut(duration: 0.25),
                            value: starPhase
                        )
                }

                VStack(spacing: 26) {
                    Spacer(minLength: 40)

                    spinningEarth
                        .frame(width: min(proxy.size.width * 0.52, 260), height: min(proxy.size.width * 0.52, 260))
                        .shadow(color: Color.blue.opacity(0.45), radius: 30, x: 0, y: 0)

                    VStack(spacing: 10) {
                        Text("Wildwood Learning Zoo")
                            .font(.largeTitle.weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)

                        Text("Explore animals, habitats, maps, and the people who care for the zoo.")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.opacity(0.78))
                            .frame(maxWidth: 420)
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

                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 28)
            }
        }
        .onAppear {
            earthSpins = true
        }
        .task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(1))
                withAnimation(.easeInOut(duration: 0.25)) {
                    starPhase = (starPhase + 1) % 3
                }
            }
        }
    }

    private var spinningEarth: some View {
        GeometryReader { proxy in
            let size = min(proxy.size.width, proxy.size.height)

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.30, green: 0.72, blue: 1.00),
                                Color(red: 0.03, green: 0.31, blue: 0.70),
                                Color(red: 0.01, green: 0.08, blue: 0.22)
                            ],
                            center: .topLeading,
                            startRadius: 8,
                            endRadius: size * 0.62
                        )
                    )

                HStack(spacing: size * 0.12) {
                    earthContinents(size: size)
                    earthContinents(size: size)
                }
                .offset(x: earthSpins ? -size * 0.92 : size * 0.06)
                .animation(.linear(duration: 4.2).repeatForever(autoreverses: false), value: earthSpins)
                .mask(Circle())

                ForEach([-40, 0, 40], id: \.self) { offset in
                    Ellipse()
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                        .frame(width: 44 + CGFloat(abs(offset)), height: size * 0.86)
                        .offset(x: CGFloat(offset) * 0.15)
                }

                Circle()
                    .stroke(Color.white.opacity(0.22), lineWidth: 2)

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.35), .clear],
                            startPoint: .topLeading,
                            endPoint: .center
                        )
                    )
            }
            .clipShape(Circle())
        }
    }

    private func earthContinents(size: CGFloat) -> some View {
        ZStack {
            Capsule()
                .fill(Color(red: 0.34, green: 0.72, blue: 0.34))
                .frame(width: size * 0.38, height: size * 0.16)
                .offset(x: -size * 0.24, y: -size * 0.18)
                .rotationEffect(.degrees(-18))

            Circle()
                .fill(Color(red: 0.42, green: 0.78, blue: 0.35))
                .frame(width: size * 0.20, height: size * 0.20)
                .offset(x: -size * 0.03, y: -size * 0.05)

            Capsule()
                .fill(Color(red: 0.25, green: 0.64, blue: 0.31))
                .frame(width: size * 0.34, height: size * 0.14)
                .offset(x: size * 0.26, y: size * 0.14)
                .rotationEffect(.degrees(22))

            Capsule()
                .fill(Color(red: 0.45, green: 0.78, blue: 0.36))
                .frame(width: size * 0.16, height: size * 0.28)
                .offset(x: -size * 0.32, y: size * 0.20)
                .rotationEffect(.degrees(10))
        }
        .frame(width: size * 0.78, height: size)
    }
}

private struct WelcomeStar: Identifiable {
    let id = UUID()
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let group: Int
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
            .padding(.horizontal, 24)
            .padding(.bottom, 14)
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
