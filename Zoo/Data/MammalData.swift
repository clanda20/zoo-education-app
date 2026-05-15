//
//  MammalData.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI

let mammalData: [Mammals] = [
    Mammals(
      id: 1,
      name: "Lion",
      classes: "mammal",
      location: "African Park",
      feedingTime: "13:00",
    
      description: "Lions are large social cats native to Africa and a small part of India. They live in groups called prides, where females usually hunt together and males help defend the territory. A lion uses powerful muscles, keen senses, and a loud roar to communicate and protect its group.",

      latitude: 33.097950,
      longitude: -116.997546, 
      hair: "Hair",
      keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
      volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 2,
    name: "Monkey",
    classes: "mammal",
    location: "Amazonian Park",
    feedingTime: "9:00",
    description: "Monkeys are intelligent primates found in many warm regions of the world. Many species live in troops, use their hands and tails to move through trees, and eat fruit, leaves, insects, and small animals. They communicate with calls, facial expressions, and body movements.",
        
    latitude: 33.098140,
    longitude: -116.999020,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Mario", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Ian", headline: "mammal", image: "Ian", description: "mammal", volunteringDays: "Monday", kidAge: 11)

  ),
   
    Mammals(
        id: 6,
    name: "Zebra",
    classes: "mammal",
    location: "African Park",
    feedingTime: "14:00",
    description: "Zebras are African members of the horse family with bold black-and-white stripes. Each zebra has a unique stripe pattern, and the stripes may help confuse biting flies and predators. Zebras live in herds and graze on grasses across savannas and open habitats.",
        
    latitude: 33.096499,
    longitude: -116.995216,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Antonio", headline: "mammal", image: "SeaTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Rose", headline: "mammal", image: "Rose", description: "mammal", volunteringDays: "Monday", kidAge: 11)
        
    ),
    Mammals(
        id: 7,
    name: "Jaguar",
    classes: "mammal",
    location: "Amazonian Park",
    feedingTime: "15:30",
    description: "Jaguars are powerful big cats native to the Americas and are especially associated with forests and wetlands. Their spotted coats help them blend into dappled light, and their strong jaws can crush tough prey. Jaguars are excellent swimmers and often hunt near rivers.",
        
    latitude: 33.097782,
    longitude: -116.999758,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "BirdWorker", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 8,
    name: "Bat",
    classes: "mammal",
    location: "American Park",
    feedingTime: "22:30",
    description: "Bats are the only mammals capable of true sustained flight. They use wings formed from long finger bones covered by a thin membrane, and many species navigate with echolocation. Bats help ecosystems by eating insects, pollinating flowers, and spreading seeds.",
        
    latitude: 33.098013,
    longitude: -116.999566,
    hair: "No, Skin",
    keeper: ZooKeeper.init(title: "Julio", headline: "mammal", image: "BirdWorker", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Martin", headline: "mammal", image: "Peter", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 9,
    name: "Chimpanzee",
    classes: "mammal",
    location: "African Park",
    feedingTime: "10:30",
    description: "Chimpanzees are great apes native to tropical Africa and are among the closest living relatives of humans. They live in social communities, use tools, and communicate with gestures, facial expressions, and calls. Chimpanzees eat fruit, leaves, insects, and sometimes meat.",
        
    latitude: 33.098261,
    longitude: -117.000379,
    hair: "Hair",
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 10,
    name: "Dolphin",
    classes: "mammal",
    location: "Ocean Park",
    feedingTime: "15:30",
    description: "Dolphins are intelligent toothed whales adapted for life in the water. They use clicks and whistles to communicate and to locate prey through echolocation. Many dolphins live in social groups and feed on fish, squid, and other marine animals.",
        
    latitude: 33.098941,
    longitude: -116.999709,
    hair: "No, Skin",
        keeper: ZooKeeper.init(title: "Patrick", headline: "Patric", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 11,
    name: "Elephant",
    classes: "mammal",
    location: "African Park",
    feedingTime: "8:30",
    description: "Elephants are the largest living land animals and are known for their trunks, tusks, and large ears. Their trunks help them breathe, smell, drink, touch, and pick up food. Elephants live in close family groups and communicate with sounds, touch, and low rumbles.",
        
    latitude: 33.098963,
    longitude: -116.997546,
    hair: "No, Skin",
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 15,
    name: "Giraffe",
    classes: "mammal",
    location: "African Park",
    feedingTime: "10:00",
    description: "Giraffes are the tallest living land animals, with long necks and legs that help them reach leaves high in trees. Their patchy coats provide camouflage among branches and sunlight. Giraffes are herbivores and often use their long tongues to pull leaves from thorny acacia trees.",
        
    latitude: 33.096791,
    longitude: -116.995564,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 16,
    name: "Gorilla",
    classes: "mammal",
    location: "African Park",
    feedingTime: "10:30",
    description: "Gorillas are large, mostly herbivorous great apes that live in forests of equatorial Africa. They usually live in family groups led by a dominant silverback male. Gorillas are powerful but generally peaceful, feeding on leaves, stems, fruit, and other plant material.",
        
    latitude: 33.098353,
    longitude: -117.000205,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
    Mammals(
        id: 18,
    name: "Orca",
    classes: "mammal",
    location: "Ocean Park",
    feedingTime: "7:30",
    description: "Orcas, also called killer whales, are the largest members of the dolphin family. They are highly social and live in groups that use complex calls and hunting strategies. Orcas are top predators and may eat fish, squid, seals, penguins, and other marine animals depending on the population.",
        
    latitude: 33.098720,
    longitude: -116.999875,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
        
    ),
    Mammals(
        id: 22,
    name: "Panda",
    classes: "mammal",
    location: "Asian Park",
    feedingTime: "10:00",
    description: "Giant pandas are bears native to mountain forests in China. Although they belong to the carnivore order, their diet is mostly bamboo, which they grasp with a special wrist bone that acts like a thumb. Pandas spend much of the day eating to get enough energy.",
        
    latitude: 33.100390,
    longitude: -116.999636,
    hair: "Hair",
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Fulltime"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteringDays: "Monday", kidAge: 11)
    ),
]
