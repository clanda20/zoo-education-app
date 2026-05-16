//
//  AmphibianData.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI

let amphibianData: [Amphibians] = [
   Amphibians(
    id: 1,
    name: "Frog",
    classes: "amphibian",
    location: "Amazonian Park",
    feedingTime: "12:30",
    description: "Frogs are tailless amphibians that usually begin life as aquatic tadpoles before becoming adults. Many frogs have long hind legs for jumping and moist skin that helps them absorb water. They play an important role by eating insects and serving as food for other animals.",
        
    latitude: 33.098549,
    longitude: -116.999324,
    swim: "swim",
    jump: "jump",
    keeper: ZooKeeper.init(title: "Tom", headline: "Amphibian", image: "SnakeTrainer", description: "Amphibian", salary: "Full-time"),
    volunteer: ZooVolunteer.init(title: "Benjamin", headline: "Amphibian", image: "Benjamin", description: "Amphibian", volunteeringDays: "Monday", kidAge: 14)
    ),
   
]
