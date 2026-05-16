//
//  AnimalData.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI

let animalData: [ZooAnimals] = [
    ZooAnimals(
      id: 1,
      name: "Lion",
      classes: "mammal",
      location: "African Park",
      feedingTime: "13:00",
    
      description: "Lions are large social cats native to Africa and a small part of India. They live in groups called prides, where females usually hunt together and males help defend the territory. A lion uses powerful muscles, keen senses, and a loud roar to communicate and protect its group.",

      latitude: 33.097950,
      longitude: -116.997546,
      keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
      volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 2,
    name: "Monkey",
    classes: "mammal",
    location: "Amazonian Park",
    feedingTime: "9:00",
    description: "Monkeys are intelligent primates found in many warm regions of the world. Many species live in troops, use their hands and tails to move through trees, and eat fruit, leaves, insects, and small animals. They communicate with calls, facial expressions, and body movements.",
        
    latitude: 33.098140,
    longitude: -116.999020,
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)

  ),
    ZooAnimals(
        id: 3,
    name: "Owl",
    classes: "bird",
    location: "American Park",
    feedingTime: "10:00",
    description: "Owls are birds of prey known for large eyes, sharp talons, and very quiet flight. Most hunt at night, using excellent hearing and vision to find small mammals, insects, and other prey. Their soft-edged feathers help them glide silently through the air.",
        
    latitude: 33.097259,
    longitude: -116.999981,
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
  ),
    ZooAnimals(
        id: 4,
    name: "Peacock",
    classes: "bird",
    location: "Asian Park",
    feedingTime: "12:00",
    description: "Peacocks are male peafowl, famous for their long, colorful tail feathers. During courtship, the male fans out his train to show bright eye-like patterns to nearby females. Peafowl spend much of their time on the ground eating seeds, insects, plants, and small creatures.",
        
    latitude: 33.099787,
    longitude: -116.999636,
    keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
    volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 5,
    name: "Iguana",
    classes: "reptile",
    location: "Amazonian Park",
    feedingTime: "15:00",
    description: "Iguanas are mostly herbivorous lizards from tropical parts of the Americas and the Caribbean. Green iguanas are strong climbers and often live near trees and water, where they can bask in the sun and escape predators. Their long tails help with balance and defense.",
        
    latitude: 33.097822,
    longitude: -116.999398,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 6,
    name: "Zebra",
    classes: "mammal",
    location: "African Park",
    feedingTime: "14:00",
    description: "Zebras are African members of the horse family with bold black-and-white stripes. Each zebra has a unique stripe pattern, and the stripes may help confuse biting flies and predators. Zebras live in herds and graze on grasses across savannas and open habitats.",
        
    latitude: 33.096499,
    longitude: -116.995216,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 7,
    name: "Jaguar",
    classes: "mammal",
    location: "Amazonian Park",
    feedingTime: "15:30",
    description: "Jaguars are powerful big cats native to the Americas and are especially associated with forests and wetlands. Their spotted coats help them blend into dappled light, and their strong jaws can crush tough prey. Jaguars are excellent swimmers and often hunt near rivers.",
        
    latitude: 33.097782,
    longitude: -116.999758,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 8,
    name: "Bat",
    classes: "mammal",
    location: "American Park",
    feedingTime: "22:30",
    description: "Bats are the only mammals capable of true sustained flight. They use wings formed from long finger bones covered by a thin membrane, and many species navigate with echolocation. Bats help ecosystems by eating insects, pollinating flowers, and spreading seeds.",
        
    latitude: 33.098013,
    longitude: -116.999566,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 9,
    name: "Chimpanzee",
    classes: "mammal",
    location: "African Park",
    feedingTime: "10:30",
    description: "Chimpanzees are great apes native to tropical Africa and are among the closest living relatives of humans. They live in social communities, use tools, and communicate with gestures, facial expressions, and calls. Chimpanzees eat fruit, leaves, insects, and sometimes meat.",
        
    latitude: 33.098261,
    longitude: -117.000379,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 10,
    name: "Dolphin",
    classes: "mammal",
    location: "Ocean Park",
    feedingTime: "15:30",
    description: "Dolphins are intelligent toothed whales adapted for life in the water. They use clicks and whistles to communicate and to locate prey through echolocation. Many dolphins live in social groups and feed on fish, squid, and other marine animals.",
        
    latitude: 33.098941,
    longitude: -116.999709,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 11,
    name: "Elephant",
    classes: "mammal",
    location: "African Park",
    feedingTime: "8:30",
    description: "Elephants are the largest living land animals and are known for their trunks, tusks, and large ears. Their trunks help them breathe, smell, drink, touch, and pick up food. Elephants live in close family groups and communicate with sounds, touch, and low rumbles.",
        
    latitude: 33.098963,
    longitude: -116.997546,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 12,
    name: "Falcon",
    classes: "bird",
    location: "American Park",
    feedingTime: "8:30",
    description: "Falcons are fast birds of prey with pointed wings and strong eyesight. Many species hunt by diving or chasing birds and other small animals in the air. Their speed, agility, and hooked beaks make them highly skilled hunters.",
        
    latitude: 33.097499,
    longitude: -117.000129,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 13,
    name: "Carp",
    classes: "fish",
    location: "Ocean Park",
    feedingTime: "7:00",
    description: "Carp are freshwater fish in the minnow family and are native mainly to Eurasia. They feed on plants, insects, and small aquatic animals, often stirring through the bottom of ponds and rivers. Some carp are raised for food, while colorful varieties are kept as ornamental fish.",
        
    latitude: 33.098710,
    longitude: -116.999060,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 14,
    name: "Frog",
    classes: "amphibian",
    location: "Amazonian Park",
    feedingTime: "10:00",
    description: "Frogs are tailless amphibians that usually begin life as aquatic tadpoles before becoming adults. Many frogs have long hind legs for jumping and moist skin that helps them absorb water. They play an important role by eating insects and serving as food for other animals.",
        
    latitude: 33.098549,
    longitude: -116.999324,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 15,
    name: "Giraffe",
    classes: "mammal",
    location: "African Park",
    feedingTime: "10:00",
    description: "Giraffes are the tallest living land animals, with long necks and legs that help them reach leaves high in trees. Their patchy coats provide camouflage among branches and sunlight. Giraffes are herbivores and often use their long tongues to pull leaves from thorny acacia trees.",
        
    latitude: 33.096791,
    longitude: -116.995564,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 16,
    name: "Gorilla",
    classes: "mammal",
    location: "African Park",
    feedingTime: "10:30",
    description: "Gorillas are large, mostly herbivorous great apes that live in forests of equatorial Africa. They usually live in family groups led by a dominant silverback male. Gorillas are powerful but generally peaceful, feeding on leaves, stems, fruit, and other plant material.",
        
    latitude: 33.098353,
    longitude: -117.000205,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 17,
    name: "Kangaroo",
    classes: "marsupial",
    location: "Australian Park",
    feedingTime: "10:00",
    description: "Kangaroos are marsupials from Australia known for powerful hind legs, large feet, and hopping movement. Females carry developing young, called joeys, in a pouch. Kangaroos graze on grasses and plants and use their strong tails for balance.",
        
    latitude: 33.101733,
    longitude: -116.997194,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 18,
    name: "Orca",
    classes: "mammal",
    location: "Ocean Park",
    feedingTime: "7:30",
    description: "Orcas, also called killer whales, are the largest members of the dolphin family. They are highly social and live in groups that use complex calls and hunting strategies. Orcas are top predators and may eat fish, squid, seals, penguins, and other marine animals depending on the population.",
        
    latitude: 33.098720,
    longitude: -116.999875,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 19,
    name: "Koala",
    classes: "marsupial",
    location: "Australian Park",
    feedingTime: "12:30",
    description: "Koalas are tree-dwelling marsupials native to eastern Australia. They feed mostly on eucalyptus leaves, which are tough and low in energy, so koalas spend many hours resting. A young koala, called a joey, develops in its mother pouch before riding on her back.",
        
    latitude: 33.101020,
    longitude: -116.997720,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 20,
    name: "Ostrich",
    classes: "bird",
    location: "African Park",
    feedingTime: "10:00",
    description: "Ostriches are large flightless birds native to Africa. They are the heaviest living birds and can run very fast on long, powerful legs. Ostriches eat plants, seeds, insects, and small animals, and their large eyes help them watch for predators in open habitats.",
        
    latitude: 33.095883,
    longitude: -116.995822,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 21,
    name: "Macaw",
    classes: "bird",
    location: "Amazonian Park",
    feedingTime: "13:30",
    description: "Macaws are colorful parrots from Central and South America. They have strong curved beaks for cracking nuts and seeds, and many species live in pairs or flocks. Macaws are intelligent, social birds that communicate with loud calls across forest habitats.",
        
    latitude: 33.097565,
    longitude: -116.999223,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 22,
    name: "Panda",
    classes: "mammal",
    location: "Asian Park",
    feedingTime: "10:00",
    description: "Giant pandas are bears native to mountain forests in China. Although they belong to the carnivore order, their diet is mostly bamboo, which they grasp with a special wrist bone that acts like a thumb. Pandas spend much of the day eating to get enough energy.",
        
    latitude: 33.100390,
    longitude: -116.999636,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 23,
    name: "Penguin",
    classes: "bird",
    location: "Ocean Park",
    feedingTime: "6:30",
    description: "Penguins are flightless seabirds adapted for swimming. Their wings work like flippers underwater, and their dark-and-white coloring helps camouflage them from predators and prey. Most penguins eat fish, squid, and krill caught while diving.",

    latitude: 33.098289,
    longitude: -116.999769,
        keeper: ZooKeeper.init(title: "Patrick", headline: "bird", image: "BirdTrainer", description: "bird", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "bird", image: "Lizzie", description: "bird", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 24,
    name: "Clownfish",
    classes: "fish",
    location: "Ocean Park",
    feedingTime: "5:30",
    description: "Clownfish are small reef fish best known for living among sea anemones. A protective mucus layer helps them avoid the anemone sting, while the fish bring movement and nutrients to their host. They live in warm shallow waters of the Indian and Pacific Oceans.",

    latitude: 33.099391,
    longitude: -116.999417,
        keeper: ZooKeeper.init(title: "Patrick", headline: "fish", image: "SeaTrainer", description: "fish", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "fish", image: "Lizzie", description: "fish", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 25,
    name: "Seal",
    classes: "mammal",
    location: "Ocean Park",
    feedingTime: "6:30",
    description: "Seals are marine mammals with streamlined bodies and flippers for swimming. They spend much of their lives in the water but come ashore or onto ice to rest, give birth, and molt. Seals hunt fish, squid, and other marine animals, using sensitive whiskers to detect movement.",

    latitude: 33.099458,
    longitude: -117.000004,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "SeaTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
    ZooAnimals(
        id: 26,
    name: "Bison",
    classes: "mammal",
    location: "American Park",
    feedingTime: "7:30",
    description: "Bison are large grazing mammals with heavy shoulders, short curved horns, and thick coats. American bison once moved across North American grasslands in huge herds, shaping prairie ecosystems as they grazed. Today they remain an important symbol of wildlife conservation.",

    latitude: 33.097508,
    longitude: -117.000510,
        keeper: ZooKeeper.init(title: "Patrick", headline: "mammal", image: "MammalTrainer", description: "mammal", salary: "Full-time"),
        volunteer: ZooVolunteer.init(title: "Lizzie", headline: "mammal", image: "Lizzie", description: "mammal", volunteeringDays: "Monday", kidAge: 11)
    ),
]
