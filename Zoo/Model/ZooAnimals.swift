//
//  ZooAnimals.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import Foundation
import SwiftUI
import MapKit

class ZooAnimals: AnimalsModel, Identifiable {
    let location: String
    let feedingTime: String
    let description: String
    var latitude: Double
    var longitude: Double
    let keeper: ZooKeeper
    let volunteer: ZooVolunteer
    
    var mapLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    
    init(id: Int, name: String, classes: String, location: String, feedingTime: String, description: String, latitude:Double, longitude: Double, keeper: ZooKeeper, volunteer:ZooVolunteer) {
        self.location = location
        self.feedingTime = feedingTime
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.keeper = ZooStaffAssignments.keeper(for: name, classes: classes, fallback: keeper)
        self.volunteer = ZooStaffAssignments.volunteer(for: id, fallback: volunteer)
        
        super.init(id: id, name: name, classes: classes)
    }
    
    func typeOverlay() -> Color{
        ZooTheme.parkColor(for: location)
    }
    
    func WelcomePopOver() -> String {
        return "Welcome"
    }
}

enum ZooStaffAssignments {
    static func keeper(for animalName: String, classes: String, fallback: ZooKeeper) -> ZooKeeper {
        let normalizedName = animalName.lowercased()
        let normalizedClass = classes.lowercased()

        if normalizedName == "penguin" {
            return keeper(named: "Tom") ?? fallback
        }

        if ["carp", "clownfish", "dolphin", "orca", "seal"].contains(normalizedName) || normalizedClass == "fish" {
            return keeper(named: "Bob") ?? fallback
        }

        if ["monkey", "chimpanzee", "gorilla"].contains(normalizedName) {
            return keeper(named: "Albert") ?? fallback
        }

        if normalizedClass == "reptile" || normalizedClass == "amphibian" {
            return keeper(named: "Julio") ?? fallback
        }

        if normalizedClass == "bird" {
            return keeper(named: normalizedName == "macaw" ? "Cecilia" : "Anna") ?? fallback
        }

        if ["lion", "zebra", "jaguar", "elephant", "giraffe", "bison", "panda", "kangaroo", "koala", "bat"].contains(normalizedName) {
            return keeper(named: "Juan") ?? fallback
        }

        return fallback
    }

    static func volunteer(for animalID: Int, fallback: ZooVolunteer) -> ZooVolunteer {
        guard !ZooVolunteerData.isEmpty else { return fallback }
        let index = abs((animalID * 7 + 3) % ZooVolunteerData.count)
        return ZooVolunteerData[index]
    }

    private static func keeper(named name: String) -> ZooKeeper? {
        zooKeeperData.first { $0.title == name }
    }
}


