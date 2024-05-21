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
        HStack {
          Text("\(transaction.desc)")
            .fontWeight(.bold)
          Spacer()
          Text("\(transaction.amount.toTwoDecimalPlaces) \(transaction.currency)" )
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

extension Double {
  var toTwoDecimalPlaces: String {
    return String(format: "%.2f", self)
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer

  return TransactionRowView(transaction: PreviewController.fiveGuys)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer

  return TransactionRowView(transaction: PreviewController.fiveGuys)
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
