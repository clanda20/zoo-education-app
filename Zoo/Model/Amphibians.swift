//
//  Amphibians.swift
//  Zoo
//
//  Created by christian landa on 11/28/23.
//

import Foundation

class Amphibians: Fishes {
    let jump: String = "jump"
    
     init(id: Int, name: String, classes: String, location: String, feedingTime: String, description: String, latitude: Double, longitude: Double, swim: String, jump: String, keeper: ZooKeeper, volunteer:ZooVolunteer) {
        
        super.init(id: id, name: name, classes: classes, location: location, feedingTime: feedingTime, description: description, latitude: latitude, longitude: longitude, swim: swim, keeper: keeper, volunteer: volunteer)
    }
    
    override func WelcomePopOver() -> String {
       return  "Welcome We are all Amphibians"
    }
    
    func UniqueAmphibians() -> String {
        "We can \(jump)"
    }
}
