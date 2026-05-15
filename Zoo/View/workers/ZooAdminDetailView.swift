//
//  ZooAdminDetailView.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI




import SwiftUI

struct ZooAdminDetailView: View {
    
    var zooAdmin: ZooAdmin
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    ZooAdminHeaderView(zooAdminKeeper: zooAdmin)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        Text(zooAdmin.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(ZooTheme.primary)
                        
                        // HEADLINE
                        Text(zooAdmin.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(ZooTheme.mutedInk)
                        
                        // SUBHEADLINE
                        Text("Learn more about \(zooAdmin.title)".uppercased())
                            .fontWeight(.bold)
                        
                        // DESCRIPTION
                        Text(zooAdmin.description)
                            .multilineTextAlignment(.leading)
                        
                        // Voluntary Day
                        Text("Employment Type: \(zooAdmin.salary)")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.bold)
                        
                        // Kid Age
                        Text("Computer Skills: \(zooAdmin.computerSkill)")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.bold)
                        
                       
                    } //: VSTACK
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                    .background(ZooTheme.surface)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .padding(.horizontal)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VSTACK
                .navigationBarTitle(zooAdmin.title, displayMode: .inline)
                .navigationBarHidden(true)
            } //: SCROLL
            .zooScreenStyle()
            .edgesIgnoringSafeArea(.top)
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

// MARK: - PREVIEW

struct ZooAdminDetailView_Previews: PreviewProvider {
static var previews: some View {
    ZooAdminDetailView(zooAdmin: zooAdminData[0])
    .previewDevice("iPhone 11 Pro")
}
}
