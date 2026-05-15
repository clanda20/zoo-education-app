//
//  MammalHeaderView.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI

struct MammalRow: View {
    let animalMammal: Mammals
    var body: some View {
        HStack(spacing: 22) {
            // Animal image
            Image(animalMammal.name.lowercased().filter{ $0 != " " })
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 110)
                .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
            VStack(alignment: .center, spacing: 10, content: {
                //Name
                Text(animalMammal.name)
                    .fontWeight(.bold)
                    .foregroundStyle(ZooTheme.ink)
                    .multilineTextAlignment(.center)
                
                //class
                Text(animalMammal.location.capitalized)
                    .font(.subheadline)
                    .zooParkChip(location: animalMammal.location)
            })
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, minHeight: 118, alignment: .leading)
        .zooCardStyle(
            background: animalMammal.typeOverlay().opacity(0.62),
            border: ZooTheme.parkBorderColor(for: animalMammal.location)
        )
    }
}
