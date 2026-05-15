//
//  BirdData.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI

let birdData: [Birds] = [
    Birds(
      id: 1,
      name: "Owl",
      classes: "bird",
      location: "American Park",
      feedingTime: "10:00",
      
      description: "Owls are birds of prey known for large eyes, sharp talons, and very quiet flight. Most hunt at night, using excellent hearing and vision to find small mammals, insects, and other prey. Their soft-edged feathers help them glide silently through the air.",

      latitude: 33.097259,
      longitude: -116.999981,
      fly: "fly",
      feather: "feather",
      beak: "beak",
      keeper: ZooKeeper.init(title: "Anna", headline: "bird", image: "BirdWorker", description: "bird", salary: "Fulltime"),
      volunteer: ZooVolunteer.init(title: "Lizzie", headline: "bird", image: "Lizzie", description: "bird", volunteringDays: "Friday", kidAge: 11)
    ),
    Birds(
        id: 2,
    name: "Peacock",
    classes: "bird",
    location: "Asian Park",
    feedingTime: "12:00",
    description: "Peacocks are male peafowl, famous for their long, colorful tail feathers. During courtship, the male fans out his train to show bright eye-like patterns to nearby females. Peafowl spend much of their time on the ground eating seeds, insects, plants, and small creatures.",
        
    latitude: 33.099787,
    longitude: -116.999636,
    fly: "fly",
    feather: "feather",
    beak: "beak",
    keeper: ZooKeeper.init(title: "Alfred", headline: "bird", image: "MonkeyWorker", description: "bird", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Mary", headline: "bird", image: "Mary", description: "bird", volunteringDays: "Friday", kidAge: 8)

  ),
   
    Birds(
        id: 3,
    name: "Falcon",
    classes: "bird",
    location: "American Park",
    feedingTime: "8:30",
    description: "Falcons are fast birds of prey with pointed wings and strong eyesight. Many species hunt by diving or chasing birds and other small animals in the air. Their speed, agility, and hooked beaks make them highly skilled hunters.",
        
    latitude: 33.097499,
    longitude: -117.000129,
    fly: "fly",
    feather: "feather",
    beak: "beak",
        keeper: ZooKeeper.init(title: "Patrick", headline: "bird", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
        
    ),
    Birds(
        id: 4,
    name: "Ostrich",
    classes: "bird",
    location: "African Park",
    feedingTime: "4:30",
    description: "Ostriches are large flightless birds native to Africa. They are the heaviest living birds and can run very fast on long, powerful legs. Ostriches eat plants, seeds, insects, and small animals, and their large eyes help them watch for predators in open habitats.",
        
    latitude: 33.095883,
    longitude: -116.995822,
    fly: "fly",
    feather: "feather",
    beak: "beak",
        keeper: ZooKeeper.init(title: "Anna", headline: "bird", image: "BirdWorker", description: "bird", salary: "Fulltime"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "bird", image: "Lizzie", description: "bird", volunteringDays: "Friday", kidAge: 11)
        
    ),
    Birds(
        id: 5,
    name: "Macaw",
    classes: "bird",
    location: "Amazonian Park",
    feedingTime: "22:30",
    description: "Macaws are colorful parrots from Central and South America. They have strong curved beaks for cracking nuts and seeds, and many species live in pairs or flocks. Macaws are intelligent, social birds that communicate with loud calls across forest habitats.",
        
    latitude: 33.097565,
    longitude: -116.999223,
    fly: "fly",
    feather: "feather",
    beak: "beak",
    keeper: ZooKeeper.init(title: "Juan", headline: "bird", image: "MonkeyWorker", description: "bird", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "bird", image: "Mary", description: "bird", volunteringDays: "Friday", kidAge: 11)
    )
]

