//
//  SwiftUIView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//



import SwiftUI

let zooKeeperData: [ZooKeeper] = [
  ZooKeeper(
      title: "Anna",
      headline: "Bird care specialist who helps train safe flight demonstrations.",
      image: "BirdWorker",

      description: """
        Anna works with the bird team to support daily feeding, habitat checks, and gentle training sessions. She helps birds practice recall flights, perch behavior, and calm interactions with guests during educational presentations.
        """
      ,
      salary: "PartTime"
    ),
    ZooKeeper(
      title: "Cecilia",
      headline: "Senior bird trainer focused on enrichment and conservation education.",
      image: "BirdTrainer",
      description: """
        Cecilia designs bird enrichment activities that encourage natural movement, problem solving, and confident flying. She also prepares the birds for public talks so visitors can learn how each species survives in the wild.
        """,
      salary: "FullTime"
    ),
  ZooKeeper(
      title: "Juan",
      headline: "Mammal keeper who cares for large herbivores and big cats.",
      image: "MammalTrainer",
      description: """
        Juan starts each day by checking habitats, preparing diets, and observing animal behavior. He works closely with mammals such as lions, zebras, and giraffes, making sure they have clean spaces, healthy meals, and meaningful enrichment.
        """,
      salary: "Partime"
    ),
  ZooKeeper(
      title: "Albert",
      headline: "Primate keeper who supports social groups and enrichment routines.",
      image: "MonkeyWorker",
      description: """
        Albert specializes in primate care, especially monkeys and apes. He plans puzzle feeders, climbing activities, and quiet observation time to help the animals stay active, curious, and socially comfortable.
        """,
      salary: "FullTime"
      
    ),
  ZooKeeper(
      title: "Tom",
      headline: "Penguin keeper who manages cold-water bird care and feeding.",
      image: "PinguinTrainer",
      description: """
        Tom helps care for penguins by preparing fish diets, monitoring water quality, and keeping nesting areas clean. He watches each bird closely during feeding time so the team can spot changes in appetite or behavior early.
        """,
      salary: "FullTime"
    ),
  ZooKeeper(
      title: "Bob",
      headline: "Marine animal keeper focused on fish, seals, and aquatic mammals.",
      image: "SeaTrainer",
      description: """
        Bob works around the Ocean Park habitats, where he helps maintain clean water, balanced diets, and safe training routines. His day often includes feeding checks, pool inspections, and enrichment for seals, dolphins, and fish.
        """,
      salary: "FullTime"
    ),
  ZooKeeper(
      title: "Julio",
      headline: "Reptile keeper who handles snakes, lizards, and habitat safety.",
      image: "SnakeTrainer",
      description: """
        Julio cares for reptiles by monitoring temperature, humidity, lighting, and feeding schedules. He helps guests understand that snakes and lizards are important animals with unique adaptations and careful habitat needs.
        """,
      salary: "FullTime"
  )
]
