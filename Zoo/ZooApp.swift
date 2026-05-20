//
//  ZooApp.swift
//  Zoo
//
//  Created by christian landa on 11/27/23.
//

import SwiftUI
import MapKit
import AVFoundation

@main
struct ZooApp: App {
    @State private var showWelcome = true
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var backgroundMusic = BackgroundMusicPlayer()
    @AppStorage("zooatlas_enable_sound_hint_shown") private var hasShownEnableSoundHint = false
    @State private var showEnableSoundHint = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showWelcome {
                    ZooWelcomeView(
                        onStart: {
                            withAnimation(.easeInOut(duration: 0.45)) {
                                showWelcome = false
                            }
                        }
                    )
                    .transition(.opacity.combined(with: .scale(scale: 0.98)))
                    .zIndex(1)
                } else {
                    MainView()
                        .transition(.opacity.combined(with: .move(edge: .trailing)))
                        .zIndex(0)
                }
            }
            .animation(.easeInOut(duration: 0.55), value: showWelcome)
            .tint(ZooTheme.primary)
            .overlay(alignment: .topTrailing) {
                VStack(alignment: .trailing, spacing: 8) {
                    if showEnableSoundHint {
                        Text("Enable ambient sound")
                            .font(.subheadline.weight(.bold))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(.ultraThinMaterial, in: Capsule())
                            .foregroundStyle(.white)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                    }

                    AudioMuteButton(
                        isMuted: backgroundMusic.isMuted,
                        onToggleMute: {
                            backgroundMusic.toggleMute()
                            if showEnableSoundHint {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    showEnableSoundHint = false
                                }
                                hasShownEnableSoundHint = true
                            }
                        }
                    )
                }
                .padding(.top, 76)
                .padding(.trailing, 16)
            }
            .onAppear {
                backgroundMusic.muteForLaunch()
                backgroundMusic.setTrack(named: "jungleSong_iOS", fileExtension: "mp3")
                if !hasShownEnableSoundHint {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        showEnableSoundHint = true
                    }
                }
            }
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == .active {
                    backgroundMusic.ensurePlaying()
                }
            }
        }
    }
}

final class BackgroundMusicPlayer: ObservableObject {
    @Published private(set) var isMuted: Bool

    private var audioPlayer: AVAudioPlayer?
    private var currentResource: (name: String, ext: String)?
    private let baseVolume: Float = 0.05

    init() {
        isMuted = true
    }

    func playLoop(named resourceName: String, fileExtension: String) {
        currentResource = (resourceName, fileExtension)

        guard let url = Bundle.main.url(forResource: resourceName, withExtension: fileExtension) else {
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)

            try initializeAudioPlayer(with: url)
            applyMuteState()
            if !isMuted {
                startIfNeeded()
            }
        } catch {
            // Keep app behavior intact if audio cannot be initialized.
        }
    }

    func setTrack(named resourceName: String, fileExtension: String) {
        currentResource = (resourceName, fileExtension)
    }

    func ensurePlaying() {
        guard !isMuted else { return }

        if audioPlayer == nil, let currentResource {
            playLoop(named: currentResource.name, fileExtension: currentResource.ext)
            return
        }

        startIfNeeded()
    }

    func toggleMute() {
        isMuted.toggle()
        applyMuteState()
        if !isMuted {
            ensurePlaying()
        }
    }

    func muteForLaunch() {
        isMuted = true
        applyMuteState()
    }

    private func initializeAudioPlayer(with url: URL) throws {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.prepareToPlay()
    }

    private func startPlayback() {
        audioPlayer?.play()
    }

    private func beginLooping() {
        audioPlayer?.numberOfLoops = -1
    }

    private func startIfNeeded() {
        guard let audioPlayer else { return }
        if !audioPlayer.isPlaying {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                // Keep app behavior intact if audio session cannot reactivate.
            }
            startPlayback()
            beginLooping()
            applyMuteState()
        }
    }

    private func applyMuteState() {
        audioPlayer?.volume = isMuted ? 0.0 : baseVolume
    }
}

struct ZooWelcomeView: View {
    let onStart: () -> Void

    var body: some View {
        GeometryReader { proxy in
            let fullWidth = proxy.size.width + proxy.safeAreaInsets.leading + proxy.safeAreaInsets.trailing
            let fullHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom

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

                VStack(spacing: 24) {
                    Spacer()
                        .frame(height: max(proxy.size.height * 0.46, 300))
                    
                    WaveTitleText(
                        text: "ZooAtlas",
                        fontSize: min(max(proxy.size.width * 0.14, 38), 64)
                    )

                    Spacer(minLength: 32)
                }
                .padding(.horizontal, 28)

                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture(perform: onStart)
            }
        }
    }
}

struct AudioMuteButton: View {
    let isMuted: Bool
    let onToggleMute: () -> Void

    var body: some View {
        Button(action: onToggleMute) {
            Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 36, height: 36)
        }
        .buttonStyle(.plain)
        .background(.ultraThinMaterial, in: Circle())
        .foregroundStyle(.white)
        .accessibilityLabel("Mute audio")
    }
}

struct WaveTitleText: View {
    let text: String
    let fontSize: CGFloat

    private var lines: [String] {
        text.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    }

    var body: some View {
        TimelineView(.animation) { timeline in
            let t = timeline.date.timeIntervalSinceReferenceDate

            VStack(spacing: 0) {
                ForEach(Array(lines.enumerated()), id: \.offset) { lineIndex, line in
                    HStack(spacing: 0) {
                        ForEach(Array(line.enumerated()), id: \.offset) { index, char in
                            let x = Double(index)
                            let linePhase = Double(lineIndex) * 0.85
                            let strength = max(0.35, 1.0 - (x / 16.0))
                            let wave = sin((t * 3.0) + (x * 0.42) + linePhase)

                            Text(String(char))
                                .font(.system(size: fontSize, weight: .black, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            Color(red: 0.99, green: 0.95, blue: 0.84),
                                            Color(red: 0.94, green: 0.86, blue: 0.69),
                                            Color(red: 0.86, green: 0.75, blue: 0.54)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .offset(y: wave * 6.0 * strength)
                                .scaleEffect(
                                    x: 1.0 + (wave * 0.035 * strength),
                                    y: 1.0 - (wave * 0.05 * strength),
                                    anchor: .center
                                )
                        }
                    }
                }
            }
            .minimumScaleFactor(0.72)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .shadow(color: .black.opacity(0.60), radius: 8, x: 0, y: 3)
            .shadow(color: Color(red: 0.35, green: 0.26, blue: 0.14).opacity(0.45), radius: 2, x: 0, y: 0)
            .drawingGroup()
            .accessibilityLabel("ZooAtlas")
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

struct AnimalProfileStaffView<Destination: View>: View {
    let title: String
    let name: String
    let image: String
    let destination: Destination

    init(title: String, name: String, image: String, @ViewBuilder destination: () -> Destination) {
        self.title = title
        self.name = name
        self.image = image
        self.destination = destination()
    }

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.title2)
                .bold()

            NavigationLink(destination: destination) {
                VStack(spacing: 10) {
                    Image(image)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120, alignment: .center)
                        .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
                        .cornerRadius(8)

                    Text(name)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(ZooTheme.ink)
                }
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 6)
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
