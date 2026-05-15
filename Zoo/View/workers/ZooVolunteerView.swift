//
//  ZooVolunteerView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

struct ZooVolunteerView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var zoovolunteer: [ZooVolunteer] = ZooVolunteerData

    // MARK: - BODY

    var body: some View {
      NavigationView {
        List {
          ForEach(zoovolunteer.shuffled()) { item in
              NavigationLink(destination: ZooVolunteerDatailView(zooVolunteer: item)) {
                  ZooVolunteerRowView(zooVolunteer: item)
                .padding(.vertical, 4)
            }
          }
        }
        .navigationTitle("Meet the Zoo Keepers")
        .navigationBarItems(
          trailing:
            Button(action: {
              isShowingSettings = true
            }) {
              Image(systemName: "slider.horizontal.3")
            } //: BUTTON
  //          .sheet(isPresented: $isShowingSettings) {
  //            SettingsView()
  //          }
        )
      } //: NAVIGATION
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }

  // MARK: - PREVIEW

  struct ZooVolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        ZooVolunteerView(zoovolunteer: ZooVolunteerData)
        .previewDevice("iPhone 11 Pro")
    }
  }
