//
//  AnimalDetail.swift
//  Zoo
//
//  Created by christian landa on 11/30/23.
//
/// should be only 1rs
import SwiftUI
import MapKit
import SwiftUI

struct AnimalDetail: View {
    
    let animal: ZooAnimals
    @State private var showAlert = false
    @State private var show = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 24){
                Image(animal.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .animalHeroImageStyle()
                    .shadow(color: ZooTheme.primary.opacity(0.24), radius: 8, x: 0, y: 4)
                    .padding(.top, 100)

                VStack(alignment:.leading){
                    Text(animal.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 8)
                    
                    Text("Located in: \(animal.location)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Feeding Time: \(animal.feedingTime)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                
                    Button("Welcome") {
                                self.show = true
                            }
                            .zooParkButton(location: animal.location)
                            .popover(isPresented: self.$show,
                                     attachmentAnchor: .point(.center),
                                     arrowEdge: .top,
                                     content: {
                                Text(animal.WelcomePopOver())
                                    .padding()
                                    .presentationCompactAdaptation(.none)
                            })
                    
                    Text("Description:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text(animal.description)
                        .font(.title2)
                        .padding(.bottom, 4)
                    
                    Text("Meet the Zoo Keeper")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animal.keeper.headline)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animal.keeper.image)
                      .renderingMode(.original)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 120, height: 120, alignment: .center)
                      .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
                      .cornerRadius(8)
                    
                    Text("Meet the Zoo Volunteers")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Text(animal.volunteer.headline)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 15)
                    
                    Image(animal.volunteer.image)
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
                    
                    let location = CLLocationCoordinate2D(latitude: self.animal.latitude, longitude: self.animal.longitude)
                    AnimalProfileMap(animalName: animal.name, animalCoordinate: location)
                        .padding(.bottom, 22)
                }
                
                .padding(.top)
                .padding()
                .background(animal.typeOverlay().opacity(0.66))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(ZooTheme.parkBorderColor(for: animal.location).opacity(0.45), lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .padding(.horizontal)
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        .safeAreaPadding(.bottom, 28)
        .zooScreenStyle()
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct AnimalDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnimalDetail(animal: animalData[1])
            .previewDevice("iPhone 11 Pro")
    }}
