//
//  ReptileDetail.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI
import MapKit

struct ReptileDetail: View {
    
    let animalReptile: Reptiles
    //var zooKeeper: ZooKeeper
    
    @State private var show = false
    @State private var show2 = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 24){
                
                Image(animalReptile.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .animalHeroImageStyle()
                    .shadow(color: ZooTheme.primary.opacity(0.24), radius: 8, x: 0, y: 4)
                    .padding(.top, 100)

                VStack(alignment:.leading){
                    Text(animalReptile.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                   
                    Button("Welcome") {
                                self.show = true
                            }
                            .zooParkButton(location: animalReptile.location)
                            .popover(isPresented: self.$show,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalReptile.WelcomePopOver())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    Button("Reptile") {
                                self.show2 = true
                            }
                            .zooParkButton(location: animalReptile.location)
                            .popover(isPresented: self.$show2,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalReptile.UniqueReptiles())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    
                    Text("Located in: \(animalReptile.location)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Feeding Time: \(animalReptile.feedingTime)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalReptile.description)
                        .font(.title2)
                        .padding(.bottom, 15)
                    
                    Text("Meet the Reptile Zoo Keeper")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalReptile.keeper.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animalReptile.keeper.image)
                      .renderingMode(.original)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 120, height: 120, alignment: .center)
                      .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
                      .cornerRadius(8)
                    
                    Text("Meet the Reptiles Zoo Volunteer")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalReptile.volunteer.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animalReptile.volunteer.image)
                      .renderingMode(.original)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 120, height: 120, alignment: .center)
                      .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
                      .cornerRadius(8)
                    
                    
                    Text("Map:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 2)
                    
                    let location = CLLocationCoordinate2D(latitude: self.animalReptile.latitude, longitude: self.animalReptile.longitude)
                    AnimalProfileMap(animalName: animalReptile.name, animalCoordinate: location)
                }
                .padding()
                .background(animalReptile.typeOverlay().opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: animalReptile.location).opacity(0.45), lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .padding(.horizontal)
                    
            }
        }
        .safeAreaPadding(.bottom, 96)
        .zooScreenStyle()
        .edgesIgnoringSafeArea(.top)
    }
}

struct ReptileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReptileDetail(animalReptile: reptileData[1])
            .previewDevice("iPhone 11 Pro")
    }}
