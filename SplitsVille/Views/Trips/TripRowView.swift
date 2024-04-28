//
//  TripRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI
import SwiftData

struct TripRowView: View {
  var trip: Trip
  var body: some View {
    HStack {
      Text(trip.name)
        .font(.title2)
      Text(trip.location)
        .font(.title2)
      // TODO add friends...navigate to tipe detail?
    }
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return TripRowView(trip: PreviewController.nightOutInBedrock)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripRowView(trip: PreviewController.nightOutInBedrock)
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
