//
//  ZooAdministative.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import Foundation

class ZooAdmin: ZooKeeper {
    
    var computerSkill: String
    
    init( id: UUID = UUID(), title: String, headline: String, image: String, description: String, salary: String, computerSkill: String ) {
        self.computerSkill = computerSkill
        super.init(id: id, title: title, headline: headline, image: image, description: description, salary: salary)
        
    }
}
