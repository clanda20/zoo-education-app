//
//  ContentView.swift
//  Zoo
//
//  Created by christian landa on 11/27/23.
//
///first icon on toolbar
import SwiftUI

struct ContentView: View {
    let apController = AnimalController()
    @Binding private var navigationPath: [Int]
    @State var softAlphabetical = false
    @State var currentFilter = "All"

    init(navigationPath: Binding<[Int]> = .constant([])) {
        _navigationPath = navigationPath
    }
    
    var body: some View {
        
        apController.filterBy(location: currentFilter)
        
        if softAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.softById()
        }
        
        
        return NavigationStack(path: $navigationPath) {
        List {
            ForEach(apController.zooAnimals) { animal in
                NavigationLink(value: animal.id) {
                        AnimalRow(animal: animal)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                }
                    
            }
            .zooListStyle()
            .listStyle(.plain)
            .navigationTitle("Zoo Animals")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Int.self) { animalID in
                if let animal = animalData.first(where: { $0.id == animalID }) {
                    AnimalDetail(animal: animal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        withAnimation{
                            softAlphabetical.toggle()
                        }
                    } label: {
                        if softAlphabetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.locationFilter, id: \.self){ location in
                                HStack {
                                    Text(location)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.locationIcon(for: location))
                                }
                                
                            }
                        }
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
