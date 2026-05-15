//
//  FruitDatailView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

struct ZooKeeperDatailView: View {
  // MARK: - PROPERTIES
  
  var zooKeeper: ZooKeeper

  // MARK: - BODY

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // HEADER
            ZooKeeperHeaderView(zooKeeper: zooKeeper)
          
          VStack(alignment: .leading, spacing: 20) {
            // TITLE
            Text(zooKeeper.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundStyle(ZooTheme.primary)
            
            // HEADLINE
            Text(zooKeeper.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)
              .foregroundStyle(ZooTheme.mutedInk)
            
           
            
            // SUBHEADLINE
            Text("Learn more about \(zooKeeper.title)".uppercased())
              .fontWeight(.bold)
            
            // DESCRIPTION
            Text(zooKeeper.description)
              .multilineTextAlignment(.leading)
            
            
          } //: VSTACK
          .padding(.horizontal, 20)
          .padding(.vertical, 18)
          .background(ZooTheme.surface)
          .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
          .padding(.horizontal)
          .frame(maxWidth: 640, alignment: .center)
        } //: VSTACK
        .navigationBarTitle(zooKeeper.title, displayMode: .inline)
        .navigationBarHidden(true)
      } //: SCROLL
      .zooScreenStyle()
      .edgesIgnoringSafeArea(.top)
    } //: NAVIGATION
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - PREVIEW

struct ZooKeeperDatailView_Previews: PreviewProvider {
  static var previews: some View {
      ZooKeeperDatailView(zooKeeper: zooKeeperData[0])
      .previewDevice("iPhone 11 Pro")
  }
}
