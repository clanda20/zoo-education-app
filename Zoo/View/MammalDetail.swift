//
//  MammalDetail.swift
//  Zoo
//
//  Created by christian landa on 12/6/23.
//

import SwiftUI
import MapKit

struct MammalDetail: View {
    let animalMammal: Mammals
    @State private var show = false
    @State private var show2 = false
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 24){
                
                Image(animalMammal.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .animalHeroImageStyle()
                    .shadow(color: ZooTheme.primary.opacity(0.24), radius: 8, x: 0, y: 4)
                    .padding(.top, 100)

                VStack(alignment:.leading){
                    Text(animalMammal.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                   
                    Button("Welcome") {
                                self.show = true
                            }
                            .zooParkButton(location: animalMammal.location)
                            .popover(isPresented: self.$show,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalMammal.WelcomePopOver())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    Button("Mammals") {
                                self.show2 = true
                            }
                            .zooParkButton(location: animalMammal.location)
                            .popover(isPresented: self.$show2,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalMammal.UniqueMammals())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    
                    Text("Located in: \(animalMammal.location)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Feeding Time: \(animalMammal.feedingTime)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalMammal.description)
                        .font(.title2)
                        .padding(.bottom, 15)
                    
                    AnimalProfileStaffView(
                        title: "Meet the Zoo Keeper",
                        name: animalMammal.keeper.title,
                        image: animalMammal.keeper.image
                    )
                    
                    AnimalProfileStaffView(
                        title: "Meet the Zoo Volunteers",
                        name: animalMammal.volunteer.title,
                        image: animalMammal.volunteer.image
                    )
                    
                    
                    Text("Map:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 2)
                    
                    let location = CLLocationCoordinate2D(latitude: self.animalMammal.latitude, longitude: self.animalMammal.longitude)
                    AnimalProfileMap(animalName: animalMammal.name, animalCoordinate: location)
                        .animalProfileMapInset()
                }
                .padding()
                .background(animalMammal.typeOverlay().opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: animalMammal.location).opacity(0.45), lineWidth: 1)
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

struct MammalDetail_Previews: PreviewProvider {
    static var previews: some View {
        MammalDetail(animalMammal: mammalData[1])
            .previewDevice("iPhone 11 Pro")
    }}
