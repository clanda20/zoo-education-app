//
//  FishDetail.swift
//  Zoo
//
//  Created by christian landa on 12/8/23.
//

import SwiftUI
import MapKit

struct FishDetail: View {
    let animalFish: Fishes
    @State private var show = false
    @State private var show2 = false
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 24){
                
                Image(animalFish.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .animalHeroImageStyle()
                    .shadow(color: ZooTheme.primary.opacity(0.24), radius: 8, x: 0, y: 4)
                    .padding(.top, 100)

                VStack(alignment:.leading){
                    Text(animalFish.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                   
                    Button("Welcome") {
                                self.show = true
                            }
                            .zooParkButton(location: animalFish.location)
                            .popover(isPresented: self.$show,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalFish.WelcomePopOver())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    Button("Fish") {
                                self.show2 = true
                            }
                            .zooParkButton(location: animalFish.location)
                            .popover(isPresented: self.$show2,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animalFish.UniqueFishes())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                            .padding(.bottom, 4)
                    
                    
                    Text("Located in: \(animalFish.location)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Feeding Time: \(animalFish.feedingTime)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalFish.description)
                        .font(.title2)
                        .padding(.bottom, 15)
                    
                    Text("Meet the Fishes Zoo Keeper")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalFish.keeper.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animalFish.keeper.image)
                      .renderingMode(.original)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 120, height: 120, alignment: .center)
                      .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
                      .cornerRadius(8)
                    
                    Text("Meet the Fishes Zoo Volunteers")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalFish.volunteer.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animalFish.volunteer.image)
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
                    
                    let location = CLLocationCoordinate2D(latitude: self.animalFish.latitude, longitude: self.animalFish.longitude)
                    AnimalProfileMap(animalName: animalFish.name, animalCoordinate: location)
                }
                .padding()
                .background(animalFish.typeOverlay().opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: animalFish.location).opacity(0.45), lineWidth: 1)
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

struct FishDetail_Previews: PreviewProvider {
    static var previews: some View {
        FishDetail(animalFish: fishData[1])
            .previewDevice("iPhone 11 Pro")
    }}
