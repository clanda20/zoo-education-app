//
//  SourceLinkView.swift
//  Zoo
//
//  Created by christian landa on 12/5/23.
//

import SwiftUI

struct SourceLinkView: View {
  private let sourceURL = URL(string: "https://www.wikipedia.org") ?? URL(fileURLWithPath: "/")

  var body: some View {
    GroupBox() {
      HStack {
        Text("Content source")
          .foregroundStyle(ZooTheme.mutedInk)
        Spacer()
        Link("Wikipedia", destination: sourceURL)
          .foregroundStyle(ZooTheme.primary)
        Image(systemName: "arrow.up.right.square")
          .foregroundStyle(ZooTheme.secondary)
      }
      .font(.footnote)
    }
    .backgroundStyle(ZooTheme.surface)
  }
}

struct SourceLinkView_Previews: PreviewProvider {
  static var previews: some View {
    SourceLinkView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
