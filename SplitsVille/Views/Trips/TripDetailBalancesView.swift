//
//  TripDetailBalancesView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 01/05/2024.
//

import SwiftUI

struct TripDetailBalancesView: View {
  var trip: Trip
  var body: some View {
    Text("Balances View for \(trip.name)")
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailBalancesView(trip: PreviewController.nightOutInBedrock)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailBalancesView(trip: PreviewController.nightOutInBedrock)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
