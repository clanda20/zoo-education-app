//
//  ZooIllustratedMapView.swift
//  Zoo
//
//  Created by Codex on 5/15/26.
//

import SwiftUI

enum ZooMapLayout {
    static let entranceName = "Zoo Entrance"
    static let entrancePoint = CGPoint(x: 0.50, y: 0.94)

    static func point(for animalName: String) -> CGPoint {
        animalPoints[animalName.lowercased()] ?? CGPoint(x: 0.50, y: 0.50)
    }

    static func point(forLocationName name: String) -> CGPoint {
        name == entranceName ? entrancePoint : point(for: name)
    }

    private static let animalPoints: [String: CGPoint] = [
        "lion": CGPoint(x: 0.23, y: 0.27),
        "monkey": CGPoint(x: 0.40, y: 0.39),
        "owl": CGPoint(x: 0.24, y: 0.68),
        "peacock": CGPoint(x: 0.54, y: 0.16),
        "iguana": CGPoint(x: 0.64, y: 0.55),
        "zebra": CGPoint(x: 0.18, y: 0.47),
        "jaguar": CGPoint(x: 0.49, y: 0.62),
        "bat": CGPoint(x: 0.38, y: 0.62),
        "chimpanzee": CGPoint(x: 0.28, y: 0.37),
        "dolphin": CGPoint(x: 0.57, y: 0.40),
        "elephant": CGPoint(x: 0.29, y: 0.23),
        "falcon": CGPoint(x: 0.32, y: 0.72),
        "carp": CGPoint(x: 0.68, y: 0.36),
        "frog": CGPoint(x: 0.66, y: 0.49),
        "giraffe": CGPoint(x: 0.23, y: 0.53),
        "gorilla": CGPoint(x: 0.34, y: 0.32),
        "kangaroo": CGPoint(x: 0.76, y: 0.24),
        "orca": CGPoint(x: 0.53, y: 0.35),
        "koala": CGPoint(x: 0.81, y: 0.31),
        "ostrich": CGPoint(x: 0.18, y: 0.58),
        "macaw": CGPoint(x: 0.55, y: 0.58),
        "panda": CGPoint(x: 0.72, y: 0.18),
        "penguin": CGPoint(x: 0.51, y: 0.45),
        "clownfish": CGPoint(x: 0.70, y: 0.42),
        "seal": CGPoint(x: 0.45, y: 0.36),
        "bison": CGPoint(x: 0.20, y: 0.76)
    ]
}

struct InteractiveZooMap: View {
    let animals: [ZooAnimals]
    var selectedAnimalName: String?
    var visitorName: String?
    var compact: Bool = false

    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 1
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    private var minScale: CGFloat { compact ? 1.0 : 0.86 }
    private var maxScale: CGFloat { compact ? 3.2 : 2.2 }

    var body: some View {
        GeometryReader { proxy in
            let canvasSize = CGSize(
                width: compact ? proxy.size.width * 1.85 : max(proxy.size.width, 760),
                height: compact ? max(proxy.size.height * 1.35, 520) : max(proxy.size.height, 1120)
            )

            ZStack(alignment: .bottomTrailing) {
                ZooIllustratedMapCanvas(
                    animals: animals,
                    selectedAnimalName: selectedAnimalName,
                    visitorName: visitorName,
                    compact: compact
                )
                .frame(width: canvasSize.width, height: canvasSize.height)
                .scaleEffect(scale)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = CGSize(
                                width: lastOffset.width + value.translation.width,
                                height: lastOffset.height + value.translation.height
                            )
                        }
                        .onEnded { _ in
                            lastOffset = offset
                        }
                )
                .simultaneousGesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = min(max(lastScale * value, minScale), maxScale)
                        }
                        .onEnded { _ in
                            lastScale = scale
                        }
                )

                HStack(spacing: 10) {
                    Button {
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                            scale = max(scale - 0.25, minScale)
                            lastScale = scale
                        }
                    } label: {
                        Image(systemName: "minus.magnifyingglass")
                    }

                    Button {
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                            scale = min(scale + 0.25, maxScale)
                            lastScale = scale
                        }
                    } label: {
                        Image(systemName: "plus.magnifyingglass")
                    }

                    Button {
                        withAnimation(.spring(response: 0.30, dampingFraction: 0.85)) {
                            resetView(in: proxy.size, canvasSize: canvasSize)
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                    }
                }
                .font(.title3.weight(.bold))
                .padding(10)
                .background(ZooTheme.surface.opacity(0.9))
                .clipShape(Capsule())
                .shadow(color: ZooTheme.primary.opacity(0.16), radius: 8, x: 0, y: 4)
                .padding(compact ? 10 : 18)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ZooTheme.background)
            .clipShape(RoundedRectangle(cornerRadius: compact ? 24 : 0, style: .continuous))
            .onAppear {
                resetView(in: proxy.size, canvasSize: canvasSize)
            }
            .onChange(of: selectedAnimalName ?? "") { _, _ in
                resetView(in: proxy.size, canvasSize: canvasSize)
            }
        }
        .frame(maxWidth: .infinity, minHeight: compact ? 340 : 640)
    }

    private func resetView(in viewportSize: CGSize, canvasSize: CGSize) {
        guard compact, let selectedAnimalName else {
            scale = 1
            lastScale = 1
            offset = .zero
            lastOffset = .zero
            return
        }

        let focusScale: CGFloat = 2.05
        let focusPoint = ZooMapLayout.point(for: selectedAnimalName)
        let centeredOffset = CGSize(
            width: -((focusPoint.x - 0.5) * canvasSize.width * focusScale),
            height: -((focusPoint.y - 0.5) * canvasSize.height * focusScale)
        )

        scale = focusScale
        lastScale = focusScale
        offset = centeredOffset
        lastOffset = centeredOffset
    }
}

private struct ZooIllustratedMapCanvas: View {
    let animals: [ZooAnimals]
    let selectedAnimalName: String?
    let visitorName: String?
    let compact: Bool

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack {
                ZooMapBackground()

                parkZone("African Park", color: ZooTheme.parkColor(for: "African Park"), center: CGPoint(x: 0.25, y: 0.40), width: 0.34, height: 0.48, in: size)
                parkZone("Amazonian Park", color: ZooTheme.parkColor(for: "Amazonian Park"), center: CGPoint(x: 0.52, y: 0.57), width: 0.34, height: 0.42, in: size)
                parkZone("American Park", color: ZooTheme.parkColor(for: "American Park"), center: CGPoint(x: 0.27, y: 0.73), width: 0.36, height: 0.25, in: size)
                parkZone("Asian Park", color: ZooTheme.parkColor(for: "Asian Park"), center: CGPoint(x: 0.60, y: 0.18), width: 0.34, height: 0.25, in: size)
                parkZone("Australian Park", color: ZooTheme.parkColor(for: "Australian Park"), center: CGPoint(x: 0.78, y: 0.30), width: 0.27, height: 0.29, in: size)
                oceanZone(in: size)

                mainPaths(in: size)

                if let selectedAnimalName, let visitorName {
                    routeLine(
                        from: ZooMapLayout.point(forLocationName: visitorName),
                        to: ZooMapLayout.point(for: selectedAnimalName),
                        in: size
                    )
                }

                entranceMarker(in: size)

                if let visitorName {
                    visitorMarker(name: visitorName, in: size)
                }

                ForEach(animals) { animal in
                    let isSelected = selectedAnimalName?.caseInsensitiveCompare(animal.name) == .orderedSame
                    let point = ZooMapLayout.point(for: animal.name)

                    if isSelected {
                        ZooIllustratedAnimalMarker(animal: animal, isSelected: true, compact: compact)
                            .position(position(point, in: size))
                    } else {
                        NavigationLink(destination: AnimalDetail(animal: animal)) {
                            ZooIllustratedAnimalMarker(animal: animal, isSelected: false, compact: compact)
                        }
                        .buttonStyle(.plain)
                        .position(position(point, in: size))
                    }
                }

                titleBadge(in: size)
            }
        }
        .background(ZooTheme.background)
    }

    private func position(_ point: CGPoint, in size: CGSize) -> CGPoint {
        CGPoint(x: point.x * size.width, y: point.y * size.height)
    }

    private func parkZone(_ title: String, color: Color, center: CGPoint, width: CGFloat, height: CGFloat, in size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: compact ? 22 : 34, style: .continuous)
                .fill(color.opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: compact ? 22 : 34, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: title).opacity(0.35), lineWidth: compact ? 1 : 2)
                }

            if !compact {
                Text(title)
                    .font(.headline.weight(.bold))
                    .foregroundStyle(ZooTheme.parkBorderColor(for: title))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(ZooTheme.surface.opacity(0.76))
                    .clipShape(Capsule())
                    .offset(y: -height * size.height * 0.38)
            }
        }
        .frame(width: width * size.width, height: height * size.height)
        .position(position(center, in: size))
    }

    private func oceanZone(in size: CGSize) -> some View {
        ZStack {
            Path { path in
                path.move(to: position(CGPoint(x: 0.42, y: 0.24), in: size))
                path.addCurve(
                    to: position(CGPoint(x: 0.54, y: 0.72), in: size),
                    control1: position(CGPoint(x: 0.35, y: 0.40), in: size),
                    control2: position(CGPoint(x: 0.70, y: 0.53), in: size)
                )
                path.addCurve(
                    to: position(CGPoint(x: 0.68, y: 0.78), in: size),
                    control1: position(CGPoint(x: 0.58, y: 0.75), in: size),
                    control2: position(CGPoint(x: 0.63, y: 0.78), in: size)
                )
                path.addLine(to: position(CGPoint(x: 0.82, y: 0.40), in: size))
                path.addCurve(
                    to: position(CGPoint(x: 0.53, y: 0.22), in: size),
                    control1: position(CGPoint(x: 0.74, y: 0.29), in: size),
                    control2: position(CGPoint(x: 0.63, y: 0.25), in: size)
                )
                path.closeSubpath()
            }
            .fill(ZooTheme.parkColor(for: "Ocean Park").opacity(0.72))
            .overlay {
                Path { path in
                    path.move(to: position(CGPoint(x: 0.42, y: 0.24), in: size))
                    path.addCurve(
                        to: position(CGPoint(x: 0.54, y: 0.72), in: size),
                        control1: position(CGPoint(x: 0.35, y: 0.40), in: size),
                        control2: position(CGPoint(x: 0.70, y: 0.53), in: size)
                    )
                    path.addCurve(
                        to: position(CGPoint(x: 0.68, y: 0.78), in: size),
                        control1: position(CGPoint(x: 0.58, y: 0.75), in: size),
                        control2: position(CGPoint(x: 0.63, y: 0.78), in: size)
                    )
                    path.addLine(to: position(CGPoint(x: 0.82, y: 0.40), in: size))
                    path.addCurve(
                        to: position(CGPoint(x: 0.53, y: 0.22), in: size),
                        control1: position(CGPoint(x: 0.74, y: 0.29), in: size),
                        control2: position(CGPoint(x: 0.63, y: 0.25), in: size)
                    )
                    path.closeSubpath()
                }
                .stroke(ZooTheme.parkBorderColor(for: "Ocean Park").opacity(0.35), lineWidth: compact ? 1 : 2)
            }

            if !compact {
                Text("Ocean Park")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(ZooTheme.parkBorderColor(for: "Ocean Park"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(ZooTheme.surface.opacity(0.76))
                    .clipShape(Capsule())
                    .position(position(CGPoint(x: 0.66, y: 0.32), in: size))
            }
        }
    }

    private func mainPaths(in size: CGSize) -> some View {
        ZStack {
            pathStroke([
                CGPoint(x: 0.50, y: 0.94),
                CGPoint(x: 0.50, y: 0.78),
                CGPoint(x: 0.45, y: 0.62),
                CGPoint(x: 0.38, y: 0.48),
                CGPoint(x: 0.36, y: 0.30),
                CGPoint(x: 0.50, y: 0.13),
                CGPoint(x: 0.72, y: 0.18),
                CGPoint(x: 0.82, y: 0.32)
            ], in: size)

            pathStroke([
                CGPoint(x: 0.22, y: 0.76),
                CGPoint(x: 0.34, y: 0.66),
                CGPoint(x: 0.52, y: 0.58),
                CGPoint(x: 0.68, y: 0.48),
                CGPoint(x: 0.74, y: 0.36)
            ], in: size)

            pathStroke([
                CGPoint(x: 0.18, y: 0.25),
                CGPoint(x: 0.28, y: 0.34),
                CGPoint(x: 0.31, y: 0.51),
                CGPoint(x: 0.22, y: 0.62),
                CGPoint(x: 0.16, y: 0.76)
            ], in: size)
        }
    }

    private func pathStroke(_ points: [CGPoint], in size: CGSize) -> some View {
        Path { path in
            guard let first = points.first else { return }
            path.move(to: position(first, in: size))
            points.dropFirst().forEach { path.addLine(to: position($0, in: size)) }
        }
        .stroke(ZooTheme.surface.opacity(0.92), style: StrokeStyle(lineWidth: compact ? 10 : 18, lineCap: .round, lineJoin: .round))
        .shadow(color: ZooTheme.primary.opacity(0.10), radius: 2, x: 0, y: 1)
    }

    private func routeLine(from visitorPoint: CGPoint, to animalPoint: CGPoint, in size: CGSize) -> some View {
        Path { path in
            path.move(to: position(visitorPoint, in: size))
            path.addLine(to: position(animalPoint, in: size))
        }
        .stroke(
            ZooTheme.warmAccent,
            style: StrokeStyle(lineWidth: compact ? 4 : 6, lineCap: .round, dash: [10, 8])
        )
        .shadow(color: ZooTheme.surface.opacity(0.8), radius: 2, x: 0, y: 0)
    }

    private func entranceMarker(in size: CGSize) -> some View {
        VStack(spacing: 2) {
            Image(systemName: "door.left.hand.open")
                .font(compact ? .title3 : .title)
                .foregroundStyle(ZooTheme.surface)
                .padding(compact ? 7 : 10)
                .background(ZooTheme.primary)
                .clipShape(Circle())

            if !compact {
                Text("Entrance")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(ZooTheme.primary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(ZooTheme.surface.opacity(0.9))
                    .clipShape(Capsule())
            }
        }
        .position(position(ZooMapLayout.entrancePoint, in: size))
    }

    private func visitorMarker(name: String, in size: CGSize) -> some View {
        let point = ZooMapLayout.point(forLocationName: name)

        return VStack(spacing: 2) {
            Image(systemName: "figure.walk.circle.fill")
                .font(compact ? .title2 : .largeTitle)
                .foregroundStyle(ZooTheme.secondary)
                .background(ZooTheme.surface.clipShape(Circle()))

            Text(name == ZooMapLayout.entranceName ? "You" : "You: \(name)")
                .font(.caption2.weight(.bold))
                .lineLimit(1)
                .foregroundStyle(ZooTheme.secondary)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(ZooTheme.surface.opacity(0.92))
                .clipShape(Capsule())
        }
        .position(position(point, in: size))
    }

    private func titleBadge(in size: CGSize) -> some View {
        Text("Wildwood Learning Zoo")
            .font(compact ? .caption.weight(.bold) : .title2.weight(.black))
            .foregroundStyle(ZooTheme.primary)
            .padding(.horizontal, compact ? 10 : 18)
            .padding(.vertical, compact ? 5 : 9)
            .background(ZooTheme.surface.opacity(0.86))
            .clipShape(Capsule())
            .position(position(CGPoint(x: 0.50, y: compact ? 0.06 : 0.05), in: size))
    }
}

private struct ZooMapBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.86, green: 0.94, blue: 0.72),
                    Color(red: 0.96, green: 0.94, blue: 0.78),
                    Color(red: 0.78, green: 0.91, blue: 0.70)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            ForEach(0..<32, id: \.self) { index in
                Circle()
                    .fill(ZooTheme.primary.opacity(index.isMultiple(of: 2) ? 0.08 : 0.05))
                    .frame(width: CGFloat(18 + (index % 5) * 9))
                    .position(
                        x: CGFloat((index * 67) % 370) / 370.0 * UIScreen.main.bounds.width * 2.4,
                        y: CGFloat((index * 131) % 700) / 700.0 * UIScreen.main.bounds.height * 1.8
                    )
            }
        }
    }
}

private struct ZooIllustratedAnimalMarker: View {
    let animal: ZooAnimals
    let isSelected: Bool
    let compact: Bool

    private var markerSize: CGFloat {
        if compact { return isSelected ? 58 : 32 }
        return isSelected ? 78 : 62
    }

    var body: some View {
        VStack(spacing: compact ? 1 : 3) {
            Image(animal.name.lowercased().filter { $0 != " " })
                .resizable()
                .scaledToFit()
                .padding(6)
                .frame(width: markerSize, height: markerSize)
                .background(ZooTheme.surface.opacity(0.95))
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(
                            isSelected ? ZooTheme.warmAccent : ZooTheme.parkBorderColor(for: animal.location).opacity(0.45),
                            lineWidth: isSelected ? 4 : 1.5
                        )
                }
                .shadow(color: ZooTheme.primary.opacity(0.22), radius: 5, x: 0, y: 3)

            Text(animal.name)
                .font((compact ? Font.caption2 : Font.caption).weight(.bold))
                .lineLimit(1)
                .foregroundStyle(ZooTheme.primary)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(ZooTheme.surface.opacity(0.92))
                .clipShape(Capsule())
                .opacity(compact && !isSelected ? 0 : 1)
        }
        .accessibilityLabel(animal.name)
    }
}
