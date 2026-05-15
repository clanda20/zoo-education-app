//
//  Animals.swift
//  Zoo
//
//  Created by christian landa on 11/27/23.
//

import Foundation
import SwiftUI
import MapKit

class Animals: Codable, Identifiable {
    let id: Int
    let name: String
    let classes: String
    let location: String
    let feedingTime: String
    let description: String

    func typeOverlay() -> Color{
        ZooTheme.parkColor(for: location)
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - id: <#id description#>
    ///   - name: <#name description#>
    ///   - classes: <#classes description#>
    ///   - location: <#location description#>
    ///   - feedingTime: <#feedingTime description#>
    ///   - description: <#description description#>
        init(id: Int, name: String, classes: String, location: String, feedingTime: String, description: String) {
        self.id = id
        self.name = name
        self.classes = classes
        self.location = location
        self.feedingTime = feedingTime
        self.description = description
    }
    

}
