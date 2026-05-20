//
//  ZooKeeperView.swift
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
    
    private let singleWorkerRow = Array(
        repeating: GridItem(.fixed(132), spacing: 14),
        count: 1
    )

    private let volunteerRows = Array(
        repeating: GridItem(.fixed(132), spacing: 14),
        count: 2
    )
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Section{
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: singleWorkerRow, spacing: 14) {
                            ForEach(zookeeper.shuffled()) { item in
                                NavigationLink(destination: ZooKeeperDatailView(zooKeeper: item)) {
                                    ZooKeeperRowView(zooKeeper: item)
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    }
                    .frame(height: 172)
                    .background(ZooTheme.background)
                } header: {
                    Text("Zoo Keepers")
                        .zooSectionHeader(accent: ZooTheme.keeperAccent)
                    
                     }
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: singleWorkerRow, spacing: 14) {
                            ForEach(zooAdmin.shuffled()) { item in
                                NavigationLink(destination: ZooAdminDetailView(zooAdmin: item)) {
                                    ZooAdminRowView(zooAdmin: item)
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    }
                    .frame(height: 172)
                    .background(ZooTheme.background)
                }  header: {
                    Text("Zoo Administrators")
                        .zooSectionHeader(accent: ZooTheme.adminAccent)
                        
                }
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: volunteerRows, spacing: 14) {
                            ForEach(zoovolunteer.shuffled()) { item in
                                NavigationLink(destination: ZooVolunteerDatailView(zooVolunteer: item)) {
                                    ZooVolunteerRowView(zooVolunteer: item)
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    }
                    .frame(height: 304)
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
