//
//  ZoodAdminHeaderView.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//



import SwiftUI

struct ZooAdminHeaderView: View {
      // MARK: - PROPERTIES
      
      var zooAdminKeeper: ZooAdmin
      
      @State private var isAnimatingImage: Bool = false

      // MARK: - BODY

      var body: some View {
        ZStack {
            LinearGradient(
              colors: [ZooTheme.background, ZooTheme.surface],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          
            Image(zooAdminKeeper.image)
            .resizable()
            .scaledToFit()
            .blendMode(.multiply)
            .frame(width: 250, height: 250)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .padding(.vertical, 20)
            .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        } //: ZSTACK
        .frame(height: 440)
        .onAppear() {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimatingImage = true
          }
        }
      }
    }

    // MARK: - PREVIEW

    struct ZooAdminHeaderView_Previews: PreviewProvider {
      static var previews: some View {
          ZooAdminHeaderView(zooAdminKeeper: zooAdminData[0])
          .previewLayout(.fixed(width: 375, height: 440))
      }
    }
