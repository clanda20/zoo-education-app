//
//  BiologyView.swift
//  Zoo
//
//  Created by christian landa on 12/1/23.
//

import SwiftUI

struct BiologyView: View {
    let apController = AnimalController()
    @State var currentClassFilter = "All"
    
    var body: some View {
        
        apController.filterBy(classes: currentClassFilter)
        
        
        return NavigationView {
        List {
            ForEach(apController.zooAnimals) { animal in
                NavigationLink(destination: AnimalDetail(animal: animal)){
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentClassFilter.animation()) {
                            ForEach(apController.classFilter, id: \.self){ classes in
                                HStack {
                                    Text(classes)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.classesIcon(for: classes))
                                }
                                
                            }
                        }
                        
                    } label: {
                        Image(systemName: "square.fill.text.grid.1x2")
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
