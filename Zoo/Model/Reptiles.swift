//
//  Reptiles.swift
//  Zoo
//
//  Created by christian landa on 11/28/23.
//

import Foundation

class Reptiles: ZooAnimals {
    let coldBlood: String = "cold blood"
    
    init(id: Int, name: String, classes: String, location: String, feedingTime: String, description: String, latitude: Double, longitude: Double, coldBlood: String, keeper: ZooKeeper, volunteer:ZooVolunteer) {
        
        super.init(id: id, name: name, classes: classes, location: location, feedingTime: feedingTime, description: description, latitude: latitude, longitude: longitude, keeper: keeper, volunteer: volunteer)
    }
    
    override func WelcomePopOver() -> String {
        return  super.WelcomePopOver() + " We are all Reptiles"
    }
        func UniqueReptiles() -> String {
            "We have \(coldBlood)"
        }
    }

