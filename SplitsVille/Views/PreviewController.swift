//
//  PreviewController.swift
//  SplitsVille
//
//  Created by Kevin Earls on 23/04/2024.
//

import Foundation
import SwiftData

@MainActor
enum PreviewController {
  // swiftlint:disable line_length
  static let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
  static let martha = Friend(firstName: "Martha", lastName: "Hill", currency: "EUR", imageData: Data())
  static let amy = Friend(firstName: "Amy", lastName: "Costa", currency: "USD", imageData: Data())
  static let nancy = Friend(firstName: "Nancy", lastName: "Peterson", currency: "GBP", imageData: Data())
  static let patrick = Friend(firstName: "Patrick", lastName: "Riordan", currency: "USD", imageData: Data())

  static let paris = Trip(name: "Patrick's Paris Adventure", location: "Paris")  // TODO add dates
  static let portugal = Trip(name: "Street Art", location: "Portugal")

  // swiftlint:disable implicitly_unwrapped_optional
  // Paris transactions
  static var taxi: Transaction!
  static var fiveGuys: Transaction!
  static var sainteChapelle: Transaction!
  // swiftlint:enable implicitly_unwrapped_optional


  static let previewContainer: ModelContainer = {
    do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
      let context = container.mainContext

      context.insert(kevin)
      context.insert(martha)
      context.insert(amy)
      context.insert(nancy)
      context.insert(patrick)

      context.insert(paris)
      context.insert(portugal)

      paris.addFriend(friend: kevin)
      paris.addFriend(friend: martha)
      paris.addFriend(friend: patrick)

      portugal.addFriend(friend: amy)
      portugal.addFriend(friend: nancy)
      portugal.addFriend(friend: martha)
      portugal.addFriend(friend: kevin)

      // Paris transactions
      sainteChapelle = Transaction(currency: "EUR", amount: 26.00, payer: martha, trip: paris, desc: "Admission to Sainte-Chapelle")
      taxi = Transaction(currency: "EUR", amount: 62.00, payer: kevin, trip: paris, desc: "Taxi from airport")
      fiveGuys = Transaction(currency: "EUR", amount: 46.12, payer: patrick, trip: paris, desc: "Lunch")
      // swiftlint:enable line_length

      context.insert(sainteChapelle)
      context.insert(taxi)
      context.insert(fiveGuys)

      paris.addTransaction(transaction: sainteChapelle)
      paris.addTransaction(transaction: fiveGuys)
      paris.addTransaction(transaction: taxi)

      return container
    } catch {
      fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
    }
  }()

  static var emptyContainer: ModelContainer = {
    do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
      let context = container.mainContext

      return container
    } catch {
      fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
    }
  }()
}
