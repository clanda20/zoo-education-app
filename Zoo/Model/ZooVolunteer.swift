//
//  Volunteers.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import Foundation

class ZooVolunteer: Worker, Identifiable {
    
    var volunteringDays: String
    var kidAge: Int
    
    init( id: UUID = UUID(), title: String, headline: String, image: String, description: String, volunteringDays:String, kidAge: Int) {
        
        self.volunteringDays = volunteringDays
        self.kidAge = kidAge
        
        super.init(id: id, title: title, headline: headline, image: image, description: description)
    }
}
