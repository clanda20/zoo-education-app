//
//  ZooAdminRowView.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI

struct ZooAdminRowView: View {
    // MARK: - PROPERTIES
    
    var zooAdmin: ZooAdmin

    // MARK: - BODY

    var body: some View {
      HStack {
        Image(zooAdmin.image)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
  //        .background(
  //          LinearGradient(gradient: Gradient(colors: zooKeeper.gradientColors), startPoint: .top, endPoint: .bottom)
  //        )
          .cornerRadius(8)
        
        VStack(alignment: .leading, spacing: 5) {
          Text(zooAdmin.title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(ZooTheme.ink)
            Text(zooAdmin.headline)
            .font(.caption)
            .foregroundColor(ZooTheme.mutedInk)
        }
      } //: HSTACK
      .zooCardStyle(border: ZooTheme.adminAccent)
    }
  }

  // MARK: - PREVIEW

  struct ZooAdminRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZooAdminRowView(zooAdmin: zooAdminData[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
  }
