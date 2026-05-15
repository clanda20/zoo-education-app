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
        self.keeper = keeper
        self.volunteer = volunteer
        
        super.init(id: id, name: name, classes: classes)
    }
    
    func typeOverlay() -> Color{
        ZooTheme.parkColor(for: location)
    }
    
    func WelcomePopOver() -> String {
        return "Welcome"
    }
}



