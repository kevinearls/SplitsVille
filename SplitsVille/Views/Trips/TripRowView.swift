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
    VStack(alignment: .leading) {
      Text(trip.name)
        .font(.headline)
      Text(trip.location)
        .font(.subheadline)
      if case let (start?, end?) = (trip.startDate, trip.endDate) {
        Divider()
        HStack {
          Text(start, style: .date)
          Image(systemName: "arrow.right")
          Text(end, style: .date)
        }
        .font(.caption)
      }
    }
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return TripRowView(trip: PreviewController.paris)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripRowView(trip: PreviewController.paris)
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
