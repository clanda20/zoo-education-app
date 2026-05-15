//
//  FruitView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

struct ZooKeeperView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var zookeeper: [ZooKeeper] = zooKeeperData
    var zoovolunteer: [ZooVolunteer] = ZooVolunteerData
    var zooAdmin:[ZooAdmin] = zooAdminData
    
    let rows = Array(repeating: GridItem(.fixed(120), spacing: 0),
                     count: 1)
    let rowsVolunteer = Array(repeating: GridItem(.fixed(120), spacing: 0),
                     count: 2)
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView {
                Section{
                    ScrollView( .horizontal){
                        LazyHStack {
                            ForEach(zookeeper.shuffled()) { item in
                                NavigationLink(destination: ZooKeeperDatailView(zooKeeper: item)) {
                                    ZooKeeperRowView(zooKeeper: item)
                                    
                                }
                            }
                            .padding()
                        }
                        
                    }
                    .frame(height: 180)
                    .background(ZooTheme.background)
                } header: {
                    Text("Zoo Keepers")
                        .zooSectionHeader(accent: ZooTheme.keeperAccent)
                    
                     }
                Section {
                    ScrollView (.horizontal){
                        LazyHGrid(rows: rows, spacing: 0) {
                            ForEach(zooAdmin.shuffled()) { item in
                                NavigationLink(destination: ZooAdminDetailView(zooAdmin: item)) {
                                    ZooAdminRowView(zooAdmin: item)
                                        .padding()
                                }
                            }
                        }
                    }
                    .background(ZooTheme.background)
                }  header: {
                    Text("Zoo Administrators")
                        .zooSectionHeader(accent: ZooTheme.adminAccent)
                        
                }
                
                Section {
                    ScrollView (.horizontal){
                        LazyHGrid(rows: rowsVolunteer, spacing: 0) {
                            ForEach(zoovolunteer.shuffled()) { item in
                                NavigationLink(destination: ZooVolunteerDatailView(zooVolunteer: item)) {
                                    ZooVolunteerRowView(zooVolunteer: item)
                                        .padding()
                                }
                            }
                        }
                    }
                    .background(ZooTheme.background)
                }  header: {
                    Text("Zoo Volunteers")
                        .zooSectionHeader(accent: ZooTheme.volunteerAccent)
                }
            } 
            .zooScreenStyle()

        .navigationTitle("Meet Our Staff")
    }

        }
    }
// MARK: - PREVIEW

struct ZooKeeperView_Previews: PreviewProvider {
  static var previews: some View {
      ZooKeeperView(zookeeper: zooKeeperData)
      .previewDevice("iPhone 11 Pro")
  }
}
