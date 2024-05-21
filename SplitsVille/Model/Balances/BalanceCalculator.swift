//
//  BalanceCalculator.swift
//  SplitsVille
//
//  Created by Kevin Earls on 10/05/2024.
//

import Foundation
import SwiftData

enum BalanceCalculatorError {
  case friendNotFound
}

// TODO write a simplify function, which can take a [Friend: Balance] and simplify it, i.e
// if I owe you $10 and you owe me $20, it will update the amounts so that you owe me $10
struct BalanceCalculator {
  public func calculateBalances(trip: Trip, transactions: [Transaction]) -> [Friend: Balance] {
    var grid: [Friend: Balance] = [:]
    for friend in trip.friends {
      grid[friend] = Balance(principal: friend, trip: trip)
    }

    for transaction in transactions.filter({ $0.trip == trip }) {
      processTransaction(transaction, trip: trip, grid: grid)
    }

    return grid
  }

  // At this point we're assuming every transaction is shared by everyone on the trip
  // A good enhancement in the future would be to permit specifying who was included
  // on a particular transaction
  private func processTransaction(_ transaction: Transaction, trip: Trip, grid: [Friend: Balance]) {
    let amountToAdd = transaction.amount / Double(trip.friends.count)

    for friend in trip.friends where friend != transaction.paidBy {
      if let balances = grid[friend] {
        for entry in balances.entries where entry.friend == transaction.paidBy {
          entry.amount += amountToAdd
          // Fixme do currency conversion here? From entry.currency to friend.currency
        }
      }
    }
  }
}
