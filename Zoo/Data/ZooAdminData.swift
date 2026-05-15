//
//  ZooAdminData.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import Foundation

import SwiftUI

let zooAdminData: [ZooAdmin] = [
  ZooAdmin(
      title: "Teresa",
      headline: "Front gate host who welcomes guests and guides park entry.",
      image: "DoorWoman",

      description: """
        Teresa is often the first friendly face visitors meet. She helps guests find tickets, answers questions about park areas, and keeps the entrance moving smoothly during busy mornings and special events.
        """
      ,
      salary: "PartTime", 
      computerSkill: "Laptops, Ipads, Tables"
    ),
  ZooAdmin(
      title: "Michael",
      headline: "Facilities team member who keeps guest areas clean and safe.",
      image: "Janitor",
      description: """
        Michael supports the zoo by checking walkways, seating areas, restrooms, and public spaces throughout the day. His work helps every guest enjoy a clean, comfortable, and safe visit.
        """,
      salary: "FullTime",
      computerSkill: "NO"
    ),
  ZooAdmin(
      title: "Regina",
      headline: "Office coordinator who helps staff schedules and daily communication.",
      image: "Secretary",
      description: """
        Regina keeps the administrative side of the zoo organized. She helps coordinate schedules, messages, visitor requests, and supply notes so keepers, volunteers, and guest teams can focus on their work.
        """,
      salary: "Fulltime",
      computerSkill: "Mac, Windows, Ipad, etc"
    ),
  ZooAdmin(
      title: "Mellisa",
      headline: "Ticket checker who helps visitors start their zoo day smoothly.",
      image: "TicketChecker",
      description: """
        Mellisa checks passes, answers quick entrance questions, and helps families find the right path into the park. She is patient with first-time guests and keeps lines organized during crowded hours.
        """,
      salary: "FullTime", 
      computerSkill: "Ipad, Mac."
      
    ),
  ZooAdmin(
      title: "Patric",
      headline: "Ticket booth attendant who supports sales and guest information.",
      image: "TicketMan",
      description: """
        Patric helps guests choose tickets, understand park hours, and learn about special exhibits. He also supports daily ticket records so the front office has accurate visitor information.
        """,
      salary: "FullTime", 
      computerSkill: "Tables"
  )
]
