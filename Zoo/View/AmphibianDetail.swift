//
//  AmphibianDetail.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI
import MapKit

struct AmphibianDetail: View {
    let animalAmphibian: Amphibians
    
    @State private var show = false
    @State private var show2 = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 24){
                
                Image(animalAmphibian.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .animalHeroImageStyle()
                    .shadow(color: ZooTheme.primary.opacity(0.24), radius: 8, x: 0, y: 4)
                    .padding(.top, 100)

                VStack(alignment:.leading){
                    Text(animalAmphibian.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                   
                    Button("Welcome") {
                                self.show = true
                            }
                            .zooParkButton(location: animalAmphibian.location)
                            .popover(isPresented: self.$show,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalAmphibian.WelcomePopOver())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    Button("Amphibian") {
                                self.show2 = true
                            }
                            .zooParkButton(location: animalAmphibian.location)
                            .popover(isPresented: self.$show2,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalAmphibian.UniqueAmphibians())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    
                    Text("Located in: \(animalAmphibian.location)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Feeding Time: \(animalAmphibian.feedingTime)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalAmphibian.description)
                        .font(.title2)
                        .padding(.bottom, 15)
                    
                    AnimalProfileStaffView(
                        title: "Meet the Zoo Keeper",
                        name: animalAmphibian.keeper.title,
                        image: animalAmphibian.keeper.image
                    )
                    
                    AnimalProfileStaffView(
                        title: "Meet the Zoo Volunteers",
                        name: animalAmphibian.volunteer.title,
                        image: animalAmphibian.volunteer.image
                    )
                    
                    
                    Text("Map:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 2)
                    
                    let location = CLLocationCoordinate2D(latitude: self.animalAmphibian.latitude, longitude: self.animalAmphibian.longitude)
                    AnimalProfileMap(animalName: animalAmphibian.name, animalCoordinate: location)
                        .animalProfileMapInset()
                }
                .padding()
                .background(animalAmphibian.typeOverlay().opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: animalAmphibian.location).opacity(0.45), lineWidth: 1)
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

struct AmphibianDetail_Previews: PreviewProvider {
    static var previews: some View {
        AmphibianDetail(animalAmphibian: amphibianData[1])
            .previewDevice("iPhone 11 Pro")
    }}
