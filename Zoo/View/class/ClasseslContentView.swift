//
//  MammalContentView.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI

struct ClassesContentView: View {
    var zooMammal: [Mammals] = mammalData
    var zooBird: [Birds] = birdData
    var zooFish: [Fishes] = fishData
    var zooAmphibian: [Amphibians] = amphibianData
    var zooReptiles: [Reptiles] = reptileData

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    classRow(title: "Mammals", accent: ZooTheme.keeperAccent, animals: zooMammal) { animal in
                        MammalDetail(animalMammal: animal)
                    }

                    classRow(title: "Birds", accent: ZooTheme.volunteerAccent, animals: zooBird) { animal in
                        BirdDetail(animalBird: animal)
                    }

                    classRow(title: "Fishes", accent: ZooTheme.secondary, animals: zooFish) { animal in
                        FishDetail(animalFish: animal)
                    }

                    classRow(title: "Amphibians", accent: ZooTheme.adminAccent, animals: zooAmphibian) { animal in
                        AmphibianDetail(animalAmphibian: animal)
                    }

                    classRow(title: "Reptiles", accent: ZooTheme.warmAccent, animals: zooReptiles) { animal in
                        ReptileDetail(animalReptile: animal)
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 12)
            }
            .zooScreenStyle()
            .navigationTitle("Classes Animals")
        }
    }

    private func classRow<A: ZooAnimals, Destination: View>(
        title: String,
        accent: Color,
        animals: [A],
        @ViewBuilder destination: @escaping (A) -> Destination
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .zooSectionHeader(accent: accent)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 14) {
                    ForEach(animals) { animal in
                        NavigationLink(destination: destination(animal)) {
                            AnimalRow(animal: animal)
                                .frame(width: 340)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .frame(height: 146)
            .background(ZooTheme.background)
        }
    }
}

struct ClassesContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesContentView(zooMammal: mammalData)
            .previewDevice("iPhone 11 Pro")
    }
}
