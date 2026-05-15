//
//  FishData.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI

let fishData: [Fishes] = [
   Fishes(
    id: 1,
    name: "Clownfish",
    classes: "fish",
    location: "Ocean Park",
    feedingTime: "7:00",
    description: "Clownfish are small reef fish best known for living among sea anemones. A protective mucus layer helps them avoid the anemone sting, while the fish bring movement and nutrients to their host. They live in warm shallow waters of the Indian and Pacific Oceans.",
        
    latitude: 33.099391,
    longitude: -116.999417,
    swim: "swim",
    keeper: ZooKeeper.init(title: "Tom", headline: "fish", image: "PinguinTrainer", description: "fish", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Catherine", headline: "Catherine", image: "Catherine", description: "fish", volunteringDays: "Tuesday", kidAge: 9)
    ),
   
   Fishes(
   id: 2,
   name: "Carp",
   classes: "fish",
   location: "Ocean Park",
   feedingTime: "8:00",
   description: "Carp are freshwater fish in the minnow family and are native mainly to Eurasia. They feed on plants, insects, and small aquatic animals, often stirring through the bottom of ponds and rivers. Some carp are raised for food, while colorful varieties are kept as ornamental fish.",
       
   latitude: 33.098710,
   longitude: -116.999060,
   swim: "swim",
   keeper: ZooKeeper.init(title: "Bob", headline: "fish", image: "SeaTrainer", description: "fish", salary: "Fulltime"),
   volunteer: ZooVolunteer.init(title: "Ian", headline: "Ian", image: "Ian", description: "fish", volunteringDays: "Wednesday", kidAge: 12)
   )
]

