//
//  BalanceCalculator.swift
//  SplitsVille
//
//  Created by Kevin Earls on 10/05/2024.
//

import Foundation

enum BalanceCalculatorError {
  case friendNotFound
}

class BalanceCalculator {
  public func calculateBalances(trip: Trip) -> [Friend: Balance] {
    var grid: [Friend: Balance] = [:]
    for friend in trip.friends {
      grid[friend] = Balance(principal: friend, trip: trip)
    }

    for transaction in trip.transactions {
      processTransaction(transaction, grid: grid)
    }

    // TODO for debugging, remove
    print("--------------------")
    for balances in grid.values {
      print(balances.description)
    }
    print("--------------------")

    return grid
  }

  private func processTransaction(_ transaction: Transaction, grid: [Friend: Balance]) {
    //    guard let paidByBalance = grid[transaction.paidBy] else {
    //      // FIXME throw here...
    //      // throw BalanceCalculatorError.FriendNotFound
    //      return
    //    }

    let amountToAdd = transaction.amount / Double(transaction.sharedWith.count + 1)

    for friend in transaction.sharedWith where friend != transaction.paidBy {
      if let balances = grid[friend] {
        for entry in balances.entries where entry.friend == transaction.paidBy {
          entry.amount += amountToAdd
        }
      }
    }
  }

  // Find the grid entry for the payer, add amountToAdd to other people who were in on this transaction
  //    for entry in paidByBalance.entries {
  //      entry.amount += amountToAdd
  //    }
}

// TODO write a simplify function, which can take a [Friend: Balance] and simplify it, i.e
// if I owe you $10 and you owe me $20, it will update the amounts so that you owe me $10
}
