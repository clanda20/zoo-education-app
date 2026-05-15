//
//  FruitModel.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL

class ZooKeeper: Worker, Identifiable {
    
    var salary: String
    
    init( id: UUID = UUID(), title: String, headline: String, image: String, description: String, salary: String) {
        self.salary = salary
        super.init(id: id, title: title, headline: headline, image: image, description: description)
        
    }
}

