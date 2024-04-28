//
//  TransactionRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 28/04/2024.
//

import SwiftUI

struct TransactionRowView: View {
  var transaction: Transaction
  var body: some View {
    HStack {
      VStack {
        // FIXME format the amount - reformat this whole view
        Text("\(transaction.desc) \(transaction.amount) \(transaction.currency)" )
        Text("\(transaction.paidBy.fullName)")
        Text("\(transaction.trip.name)")
      }
    }
    .cornerRadius(10)
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer

  return TransactionRowView(transaction: PreviewController.dinosaurBurgers)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer

  return TransactionRowView(transaction: PreviewController.dinosaurBurgers)
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
