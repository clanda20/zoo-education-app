//
//  MammalController.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import Foundation

class MammalController {
    private var allMammal: [Mammals] = mammalData
    
    
    var zooMammals: [Mammals] = []
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
            zooMammals = allMammal.filter{
                $0.location == location
            }
        default: zooMammals = allMammal
        }
    }
    
    func filterBy(classes: String) {
        switch classes {
        case "mammal","bird","reptile","fish", "amphibian", "marsupial":
            zooMammals = allMammal.filter{
                $0.classes == classes
            }
        default: zooMammals = allMammal
        }
    }
    
    func sortByAlphabetical() {
        zooMammals.sort(by: { $0.name < $1.name })
    }
    
    func softById() {
        zooMammals.sort(by: { $0.id < $1.id})
    }
}
