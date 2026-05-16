//
//  SwiftUIView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

struct ZooVolunteerDatailView: View {
    
    var zooVolunteer: ZooVolunteer
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    ZooVolunteerHeaderView(zooVolunteerKeeper: zooVolunteer)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        Text(zooVolunteer.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(ZooTheme.primary)
                        
                        // HEADLINE
                        Text(zooVolunteer.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(ZooTheme.mutedInk)
                        
                        
                        
                        // SUBHEADLINE
                        Text("Learn more about \(zooVolunteer.title)".uppercased())
                            .fontWeight(.bold)
                        
                        // DESCRIPTION
                        Text(zooVolunteer.description)
                            .multilineTextAlignment(.leading)
                        
                        // Voluntary Day
                        Text("Volunteering Day: \(zooVolunteer.volunteeringDays)".uppercased())
                            .multilineTextAlignment(.leading)
                            .fontWeight(.bold)
                        
                        // Kid Age
                       Text("Volunteer Age: \(zooVolunteer.kidAge)".uppercased())
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
                .navigationBarTitle(zooVolunteer.title, displayMode: .inline)
                .navigationBarHidden(true)
            } //: SCROLL
            .zooScreenStyle()
            .edgesIgnoringSafeArea(.top)
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

// MARK: - PREVIEW

struct ZooVolunteerDatailView_Previews: PreviewProvider {
static var previews: some View {
    ZooVolunteerDatailView(zooVolunteer: ZooVolunteerData[0])
    .previewDevice("iPhone 11 Pro")
}
}
