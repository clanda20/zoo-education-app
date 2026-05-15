//
//  AnimalRow.swift
//  Zoo
//
//  Created by christian landa on 11/29/23.
//

import SwiftUI

struct AnimalRow: View {
    
    let animal: ZooAnimals

    var body: some View {
        HStack(spacing: 22) {
           // Animal image
            Image(animal.name.lowercased().filter{ $0 != " " })
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 110)
                .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
            VStack(alignment: .center, spacing: 10, content: {
                //Name
                Text(animal.name)
                    .fontWeight(.bold)
                    .foregroundStyle(ZooTheme.ink)
                    .multilineTextAlignment(.center)
                
                //class
                Text(animal.location.capitalized)
                    .font(.subheadline)
                    .zooParkChip(location: animal.location)
            })
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .frame(maxWidth: .infinity, minHeight: 118, alignment: .leading)
        .zooCardStyle(
            background: animal.typeOverlay().opacity(0.62),
            border: ZooTheme.parkBorderColor(for: animal.location)
        )
    }
}

struct AnimalRow_Previews: PreviewProvider{
    static var previews: some View {
        //#Preview {
        let animal = ZooAnimals(id: 1, name: "Lion", classes: "mammal", location: "African Park", feedingTime: "10:00", description: "This is the lion King",latitude: 10, longitude: 10, keeper: ZooKeeper(title: "Patrick", headline: "mammal", image: "mammalTrainer", description: "mammal", salary: "Fulltime"), volunteer: ZooVolunteer(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11))
        
        AnimalRow(animal: animal)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
/*
 let animal = ZooAnimals(id: 1, name: "Lion", classes: "mammal", location: "African Park", feedingTime: "10:00", description: "This is the lion King",latitude: 10, longitude: 10, keeper: ZooKeeper(title: "Patrick", headline: "mammal", image: "mammalTrainer", description: "mammal", salary: "Fulltime"), volunteer: (title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11))
 */
