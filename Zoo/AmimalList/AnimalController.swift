//
//  AnimalContoller.swift
//  Zoo
//
//  Created by christian landa on 11/29/23.
//

import Foundation

class AnimalController {
    private var allZooAnimals: [ZooAnimals] = animalData
    
    var zooAnimals: [ZooAnimals] = []
    /// List of all the parks in the zoo.
    let locationFilter = ["All","American Park", "Amazonian Park", "Australian Park", "Asian Park", "Ocean Park", "African Park"]
    let classFilter = ["All","mammal","bird","reptile","fish", "amphibian", "marsupial"]
    

    func locationIcon(for location: String) -> String {
        switch location {
        case "All": return "square.stack.3d.up.fill"
        case "American Park": return "leaf.fill"
        case "Amazonian Park": return "tree.fill"
        case "Australian Park": return "drop.fill"
        case "Asian Park": return "drop.fill"
        case "Ocean Park": return "leaf.fill"
        case "African Park": return "sun.max.fill"
        default: return "questionmark"
        }
    }
    
    func classesIcon(for classes: String) -> String {
        switch classes {
        case "All": return "square.stack.3d.up.fill"
        case "American Park": return "leaf.fill"
        case "Amazonian Park": return "tree.fill"
        case "Australian Park": return "drop.fill"
        case "Asian Park": return "drop.fill"
        case "Ocean Park": return "leaf.fill"
        case "African Park": return "sun.max.fill"
        default: return "questionmark"
        }
    }
    
    func filterBy(location: String) {
        switch location {
        case "American Park","Amazonian Park", "Australian Park", "Asian Park", "Ocean Park", "African Park":
            zooAnimals = allZooAnimals.filter{
                $0.location == location
            }
        default: zooAnimals = allZooAnimals
        }
    }
    
    func filterBy(classes: String) {
        switch classes {
        case "mammal","bird","reptile","fish", "amphibian", "marsupial":
            zooAnimals = allZooAnimals.filter{
                $0.classes == classes
            }
        default: zooAnimals = allZooAnimals
        }
    }
    
    func sortByAlphabetical() {
        zooAnimals.sort(by: { $0.name < $1.name })
    }
    
    func softById() {
        zooAnimals.sort(by: { $0.id < $1.id})
    }
}
