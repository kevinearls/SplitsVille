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
        HStack {
          Text("\(transaction.desc)")
            .fontWeight(.bold)
          Spacer()
          Text("\(transaction.amount) \(transaction.currency)" )
        }
        HStack {
          Text("Paid by: \(transaction.paidBy.fullName)")
          Spacer()
          Text("\(transaction.trip.name)")
        }
      }
      .padding(3)
      .border(Color.accentColor)
    }
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
