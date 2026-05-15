//
//  ZooMap.swift
//  Zoo
//
//  Created by christian landa on 11/30/23.
//

import SwiftUI

struct ZooMapView: View {
    var body: some View {
        NavigationStack {
            InteractiveZooMap(animals: animalData)
                .ignoresSafeArea(edges: .top)
                .navigationTitle("Zoo Map")
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct ZooMapView_Previews: PreviewProvider {
    static var previews: some View {
        ZooMapView()
    }
}
