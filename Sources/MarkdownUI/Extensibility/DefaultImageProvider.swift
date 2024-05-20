import NukeUI
import SwiftUI

/// The default image provider, which loads images from the network.
public struct DefaultImageProvider: ImageProvider {
  public func makeImage(url: URL?) -> some View {
    AsyncImage(url: url) { state in
      if let image = state.image {
        image
          .resizable()
          .scaledToFit()
      } else {
        Color.clear
          .frame(width: 0, height: 0)
      }
    }
  }
}

extension ImageProvider where Self == DefaultImageProvider {
  /// The default image provider, which loads images from the network.
  ///
  /// Use the `markdownImageProvider(_:)` modifier to configure this image provider for a view hierarchy.
  public static var `default`: Self {
    .init()
  }
}
