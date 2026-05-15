//
//  ReptileData.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI

let reptileData: [Reptiles] = [
            Reptiles(
                id: 1,
            name: "Iguana",
            classes: "reptile",
            location: "Amazonian Park",
            feedingTime: "15:00",
            description: "Iguanas are mostly herbivorous lizards from tropical parts of the Americas and the Caribbean. Green iguanas are strong climbers and often live near trees and water, where they can bask in the sun and escape predators. Their long tails help with balance and defense.",
                
            latitude: 33.097822,
            longitude: -116.999398,
            coldBlood: "Cold Blooded",
            keeper: ZooKeeper.init(title: "Trainer", headline: "Snake Trainer", image: "SnakeTrainer", description: "Reptile", salary: "Fulltime"),
            volunteer: ZooVolunteer.init(title: "Kid", headline: "Kids", image: "Ian", description: "help us", volunteringDays: "Tuesday", kidAge: 12)
                
            ),
            
            
        ]


