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
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.72)
                    .frame(height: UIScreen.main.bounds.height/4)
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
                    
                    Text("Meet the Amphibian Zoo Keeper")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalAmphibian.keeper.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animalAmphibian.keeper.image)
                      .renderingMode(.original)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 120, height: 120, alignment: .center)
                      .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
                      .cornerRadius(8)
                    
                    Text("Meet the Amphibian Zoo Volunteer")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animalAmphibian.volunteer.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animalAmphibian.volunteer.image)
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
                    
                    let location = CLLocationCoordinate2D(latitude: self.animalAmphibian.latitude, longitude: self.animalAmphibian.longitude)
                    AnimalProfileMap(animalName: animalAmphibian.name, animalCoordinate: location)
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
        .safeAreaPadding(.bottom, 96)
        .zooScreenStyle()
        .edgesIgnoringSafeArea(.top)
    }
}

struct AmphibianDetail_Previews: PreviewProvider {
    static var previews: some View {
        AmphibianDetail(animalAmphibian: amphibianData[1])
            .previewDevice("iPhone 11 Pro")
    }}
