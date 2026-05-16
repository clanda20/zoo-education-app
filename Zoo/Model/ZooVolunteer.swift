//
//  Volunteers.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import Foundation

class ZooVolunteer: Worker, Identifiable {
    
    var volunteeringDays: String
    var kidAge: Int
    
    init( id: UUID = UUID(), title: String, headline: String, image: String, description: String, volunteeringDays:String, kidAge: Int) {
        
        self.volunteeringDays = volunteeringDays
        self.kidAge = kidAge
        
        super.init(id: id, title: title, headline: headline, image: image, description: description)
    }
}
