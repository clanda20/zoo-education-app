//
//  MapAnnotationView.swift
//  Zoo
//
//  Created by christian landa on 12/4/23.


//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: AnimalLocation
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(ZooTheme.surface)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(ZooTheme.secondary, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            
            Image(location.name.lowercased().filter{ $0 != " " })
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .shadow(color: ZooTheme.primary.opacity(0.20), radius: 2, x: 0, y: 1)
                .clipShape(Circle())
        }
        
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

