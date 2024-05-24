//
//  TransactionDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 28/04/2024.
//

import SwiftUI

struct TransactionDetailView: View {
  var transaction: Transaction
  var body: some View {
    VStack {
      Text(Constants.Transactions.detailViewTitle)
        .font(.largeTitle)
      Divider()
      DetailRow(description: Constants.Transactions.descriptionPrompt, value: transaction.desc)
      DetailRow(description: Constants.Transactions.paidByLabel, value: transaction.paidBy.fullName)
      DetailRow(
        description: Constants.Transactions.amountPrompt,
        value: String(transaction.amount.description) + transaction.currency
      )
      DetailRow(description: Constants.Transactions.tripNameLabel, value: transaction.trip.name)
      Spacer()
    }
    .padding()
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer

  return TransactionDetailView(transaction: PreviewController.fiveGuys)
    .modelContainer(previewContainer)
}

struct DetailRow: View {
  var description: String
  var value: String

  var body: some View {
    HStack {
      Text("\(description)")
        .font(.title2)
        .fontWeight(.bold)
      Text("\(value)")
        .font(.title2)
      Spacer()
    }
    .padding(.leading)
  }
}
