import SwiftUI

struct ZooKeeperRowView: View {
  // MARK: - PROPERTIES
  
  var zooKeeper: ZooKeeper

  // MARK: - BODY

  var body: some View {
    HStack {
      Image(zooKeeper.image)
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .frame(width: 82, height: 104, alignment: .center)
        .shadow(color: ZooTheme.primary.opacity(0.18), radius: 6, x: 0, y: 3)
        .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 5) {
        Text(zooKeeper.title)
          .font(.title2)
          .fontWeight(.bold)
          .foregroundStyle(ZooTheme.ink)
          Text(zooKeeper.headline)
          .font(.caption)
          .foregroundColor(ZooTheme.mutedInk)
          .lineLimit(2)
      }
    } //: HSTACK
    .frame(width: 244, height: 108, alignment: .leading)
    .zooCardStyle(border: ZooTheme.keeperAccent)
  }
}

// MARK: - PREVIEW

struct ZooKeeperRowView_Previews: PreviewProvider {
  static var previews: some View {
      ZooKeeperRowView(zooKeeper: zooKeeperData[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
