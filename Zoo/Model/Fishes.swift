//
//  Fish.swift
//  Zoo
//
//  Created by christian landa on 11/28/23.
//

import Foundation

class Fishes: ZooAnimals {
    let swim : String
    
    init(id: Int, name: String, classes: String, location: String, feedingTime: String, description: String, latitude: Double, longitude: Double, swim: String, keeper: ZooKeeper, volunteer:ZooVolunteer) {
        self.swim = swim
        super.init(id: id, name: name, classes: classes, location: location, feedingTime: feedingTime, description: description, latitude: latitude, longitude: longitude,keeper: keeper, volunteer: volunteer)
    }
    
    override func WelcomePopOver() -> String {
       return  super.WelcomePopOver() + " We are all Fishes"
    }
    func UniqueFishes() -> String {
        "We can \(swim)"
    }
}
