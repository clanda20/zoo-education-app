//
//  Birds.swift
//  Zoo
//
//  Created by christian landa on 11/28/23.
//

import Foundation

class Birds: ZooAnimals {
    let fly: String = "fly"
    let feather: String = "feathers"
    let beak: String = "beaks"
    
    init(id: Int, name: String, classes: String, location: String, feedingTime: String, description: String, latitude: Double, longitude: Double, fly:String, feather:String, beak:String, keeper: ZooKeeper, volunteer:ZooVolunteer) {

        super.init(id: id, name: name, classes: classes, location: location, feedingTime: feedingTime, description: description, latitude: latitude, longitude: longitude, keeper: keeper, volunteer: volunteer)
        
    }
    
    override func WelcomePopOver() -> String {
         super.WelcomePopOver() + " We are all Birds"
    }
    func UniqueBirds() -> String {
        "We can \(fly), got \(feather) and \(beak)"
    }
}
