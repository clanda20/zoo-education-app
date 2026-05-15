//
//  AnimalModel.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import Foundation
import SwiftUI

class AnimalsModel  {
    let id: Int
    let name: String
    let classes: String
    
    init(id: Int, name: String, classes: String) {
        self.id = id
        self.name = name
        self.classes = classes
    }
}
