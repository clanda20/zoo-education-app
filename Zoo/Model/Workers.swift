//
//  Plant.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import Foundation

class Worker {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var description: String
    
    init(id: UUID = UUID(), title: String, headline: String, image: String, description: String) {
        self.id = id
        self.title = title
        self.headline = headline
        self.image = image
        self.description = description
    }
    
}
