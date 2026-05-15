//
//  MammalContentView.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI

struct ClassesContentView: View {
    
    @State private var isShowingSettings: Bool = false
    
    var zooMammal: [Mammals] = mammalData
    var zooBird: [Birds] = birdData
    var zooFish: [Fishes] = fishData
    var zooAmphibian: [Amphibians] = amphibianData
    var zooReptiles: [Reptiles] = reptileData
    
    var body: some View {
        
        
        NavigationView {
            ScrollView {
                Section{
                    ScrollView( .horizontal){
                        LazyHStack {
                            ForEach(zooMammal.shuffled()) { animal in
                                NavigationLink(destination: MammalDetail(animalMammal: animal)){
                                    AnimalRow(animal: animal)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(height:100)
                    .background(ZooTheme.background)
                } header: {
                    Text("Mammals")
                        .zooSectionHeader(accent: ZooTheme.keeperAccent)
                }
                
                Section{
                    ScrollView( .horizontal){
                        LazyHStack {
                            ForEach(zooBird.shuffled()) { bird in
                                NavigationLink(destination: BirdDetail(animalBird: bird)){
                                    AnimalRow(animal: bird)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(height:100)
                    .background(ZooTheme.background)
                } header: {
                    Text("Birds")
                        .zooSectionHeader(accent: ZooTheme.volunteerAccent)
                }
                
                Section{
                    ScrollView( .horizontal){
                        LazyHStack {
                            ForEach(zooFish.shuffled()) { fish in
                                NavigationLink(destination: FishDetail(animalFish: fish)){
                                    AnimalRow(animal: fish)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(height:100)
                    .background(ZooTheme.background)
                } header: {
                    Text("Fishes")
                        .zooSectionHeader(accent: ZooTheme.secondary)
                } 
                
                Section{
                    ScrollView( .horizontal){
                        LazyHStack {
                            ForEach(zooAmphibian.shuffled()) { amphibian in
                                NavigationLink(destination: AmphibianDetail(animalAmphibian: amphibian)){
                                    AnimalRow(animal: amphibian)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(height:100)
                    .background(ZooTheme.background)
                } header: {
                    Text("Amphibians")
                        .zooSectionHeader(accent: ZooTheme.adminAccent)
                }
                
                Section{
                    ScrollView( .horizontal){
                        LazyHStack {
                            ForEach(zooReptiles.shuffled()) { reptile in
                                NavigationLink(destination: ReptileDetail(animalReptile: reptile)){
                                    AnimalRow(animal: reptile)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(height:100)
                    .background(ZooTheme.background)
                } header: {
                    Text("Reptiles")
                        .zooSectionHeader(accent: ZooTheme.warmAccent)
                }
                
                .navigationTitle("Classes Animals")
            }
            .zooScreenStyle()
            
        }
    }
    
}
    struct ClassesContentView_Previews: PreviewProvider {
      static var previews: some View {
          ClassesContentView(zooMammal: mammalData)
          .previewDevice("iPhone 11 Pro")
      }
    }
