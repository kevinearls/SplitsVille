//
//  Balance.swift
//  SplitsVille
//
//  Created by Kevin Earls on 10/05/2024.
//

import Foundation

public class OwedBy: Equatable {
  public static func == (lhs: OwedBy, rhs: OwedBy) -> Bool {
    return rhs.friend == lhs.friend && rhs.currency == lhs.currency && rhs.friend == lhs.friend
  }

  let friend: Friend
  let currency: Currency
  var amount: Double = 0.0

  init(friend: Friend, currency: Currency, amount: Double = 0.0) {
    self.friend = friend
    self.currency = currency
    self.amount = amount
  }
}

public class Balance {
  let principal: Friend
  let trip: Trip
  var entries: [OwedBy] = []

  init(principal: Friend, trip: Trip) {
    self.principal = principal
    self.trip = trip
    for friend in trip.friends where friend != principal {
      let newEntry = OwedBy(friend: friend, currency: .USD, amount: 0.0)
      entries.append(newEntry)
    }
  }
}
