//
//  FruitNutrientsView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//
import SwiftUI

struct FruitNutrientsView: View {
  // MARK: - PROPERTIES
  
  var fruit: ZooKeeper
  let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]

  // MARK: - BODY

  var body: some View {
    GroupBox() {
      DisclosureGroup("Nutritional value per 100g") {
        ForEach(0..<nutrients.count, id: \.self) { item in
          Divider().padding(.vertical, 2)
          
          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(nutrients[item])
            }
            .foregroundColor(ZooTheme.secondary)
            .font(Font.system(.body).bold())
            
            Spacer(minLength: 25)
            
            Text(fruit.nutrition[item])
              .multilineTextAlignment(.trailing)
          }
        }
      }
    } //: BOX
    .backgroundStyle(ZooTheme.surface)
  }
}

// MARK: - PREVIEW

struct FruitNutrientsView_Previews: PreviewProvider {
  static var previews: some View {
    FruitNutrientsView(fruit: zooKeeperData[0])
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 375, height: 480))
      .padding()
  }
}
