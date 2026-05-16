//
//  BirdDetail.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI
import MapKit

struct BirdDetail: View {
    let animalBird: Birds
    @State private var show = false
    @State private var show2 = false
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 24){
                
                Image(animalBird.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .animalHeroImageStyle()
                    .shadow(color: ZooTheme.primary.opacity(0.24), radius: 8, x: 0, y: 4)
                    .padding(.top, 100)

                VStack(alignment:.leading){
                    Text(animalBird.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                   
                    Button("Welcome") {
                                self.show = true
                            }
                            .zooParkButton(location: animalBird.location)
                            .popover(isPresented: self.$show,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalBird.WelcomePopOver())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    Button("Bird") {
                                self.show2 = true
                            }
                            .zooParkButton(location: animalBird.location)
                            .popover(isPresented: self.$show2,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalBird.UniqueBirds())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    
                    Text("Located in: \(animalBird.location)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Feeding Time: \(animalBird.feedingTime)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalBird.description)
                        .font(.title2)
                        .padding(.bottom, 15)
                    
                    AnimalProfileStaffView(
                        title: "Meet the Zoo Keeper",
                        name: animalBird.keeper.title,
                        image: animalBird.keeper.image
                    ) {
                        ZooKeeperDatailView(zooKeeper: animalBird.keeper)
                    }
                    
                    AnimalProfileStaffView(
                        title: "Meet the Zoo Volunteers",
                        name: animalBird.volunteer.title,
                        image: animalBird.volunteer.image
                    ) {
                        ZooVolunteerDatailView(zooVolunteer: animalBird.volunteer)
                    }
                    
                    
                    Text("Map:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 2)
                    
                    let location = CLLocationCoordinate2D(latitude: self.animalBird.latitude, longitude: self.animalBird.longitude)
                    AnimalProfileMap(animalName: animalBird.name, animalCoordinate: location)
                        .animalProfileMapInset()
                }
                .padding()
                .background(animalBird.typeOverlay().opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: animalBird.location).opacity(0.45), lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .padding(.horizontal)
                    
            }
        }
        .safeAreaPadding(.bottom, 28)
        .zooScreenStyle()
        .edgesIgnoringSafeArea(.top)
    }
}

struct BirdDetail_Previews: PreviewProvider {
    static var previews: some View {
        BirdDetail(animalBird: birdData[1])
            .previewDevice("iPhone 11 Pro")
    }}
