//
//  ZooVolunteerRowView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

struct ZooVolunteerRowView: View {
    // MARK: - PROPERTIES
    
    var zooVolunteer: ZooVolunteer

    // MARK: - BODY

    var body: some View {
      HStack {
        Image(zooVolunteer.image)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 76, height: 96, alignment: .center)
          .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
  //        .background(
  //          LinearGradient(gradient: Gradient(colors: zooKeeper.gradientColors), startPoint: .top, endPoint: .bottom)
  //        )
          .cornerRadius(8)
        
        VStack(alignment: .leading, spacing: 5) {
          Text(zooVolunteer.title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(ZooTheme.ink)
            Text(zooVolunteer.title)
            .font(.caption)
            .foregroundColor(ZooTheme.mutedInk)
        }
      } //: HSTACK
      .zooCardStyle(border: ZooTheme.volunteerAccent)
    }
  }

  // MARK: - PREVIEW

  struct ZooVolunteerRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZooVolunteerRowView(zooVolunteer: ZooVolunteerData[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
  }
