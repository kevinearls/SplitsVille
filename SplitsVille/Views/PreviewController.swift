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
  static let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: Currency.EUR.rawValue, imageData: Data())
  static let wilma = Friend(firstName: "Wilma", lastName: "Flintstone", currency: Currency.EUR.rawValue, imageData: Data())
  static let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: Currency.GBP.rawValue, imageData: Data())
  static let betty = Friend(firstName: "Betty", lastName: "Rubble", currency: Currency.GBP.rawValue, imageData: Data())

  static let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
  static let martha = Friend(firstName: "Martha", lastName: "Hill", currency: "EUR", imageData: Data())
  static let amy = Friend(firstName: "Amy", lastName: "Costa", currency: "USD", imageData: Data())
  static let nancy = Friend(firstName: "Nancy", lastName: "Peterson", currency: "GBP", imageData: Data())
  static let patrick = Friend(firstName: "Patrick", lastName: "Riordan", currency: "USD", imageData: Data())
  static let mike = Friend(firstName: "Mike", lastName: "Craven", currency: "USD", imageData: Data())
  static let joann = Friend(firstName: "JoAnn", lastName: "Bianchi", currency: "EUR", imageData: Data())
  static let michelle = Friend(firstName: "Michelle", lastName: "Dubois", currency: "USD", imageData: Data())
  static let paul = Friend(firstName: "Paul", lastName: "Bauer", currency: "EUR", imageData: Data())

  static let paris = Trip(name: "Patrick's Paris Adventure", location: "Paris")  // TODO add dates
  static let portugal = Trip(name: "Street Art", location: "Portugal")
  static let ireland = Trip(name: "Family Visit", location: "Ireland")

  static let nightOutInBedrock = Trip(name: "Big Night Out", location: "Bedrock")
  static let anotherNightOut = Trip(name: "Another Night Out", location: "Somewhere")

  // FIXME how to get transactions to show up in previews?  Create them after trip and friend have been added to context?
  // swiftlint:disable implicitly_unwrapped_optional
  static var dinosaurBurgers: Transaction!
  static var friedClams: Transaction!

  // Paris transactions
  static var rerB: Transaction!
  static var arcDeTriompe: Transaction!
  static var taxi: Transaction!
  static var fiveGuys: Transaction!
  static var novotel: Transaction!
  static var dinner: Transaction!
  static var sainteChapelle: Transaction!
  // swiftlint:enable implicitly_unwrapped_optional

  //  static let dinosaurBurgers = Transaction(currency: Currency.EUR.rawValue, amount: 15.75, payer: fred, trip: nightOutInBedrock, desc: "Dinosaur Burgers")
  //  // swiftlint:enable line_length
  //
  //  static let friedClams = Transaction(
  //    currency: Currency.EUR.rawValue,
  //    amount: 21.00,
  //    payer: betty,
  //    trip: anotherNightOut,
  //    desc: "Fried clams"
  //  )

  static let previewContainer: ModelContainer = {
    do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
      let context = container.mainContext

      context.insert(fred)
      context.insert(wilma)
      context.insert(barney)
      context.insert(betty)

      context.insert(kevin)
      context.insert(martha)
      context.insert(amy)
      context.insert(nancy)
      context.insert(patrick)
      context.insert(mike)
      context.insert(joann)
      context.insert(michelle)
      context.insert(paul)

      context.insert(nightOutInBedrock)
      context.insert(anotherNightOut)

      context.insert(paris)
      context.insert(portugal)
      context.insert(ireland)

      nightOutInBedrock.addFriend(friend: fred)
      nightOutInBedrock.addFriend(friend: barney)
      anotherNightOut.addFriend(friend: betty)
      anotherNightOut.addFriend(friend: wilma)

      paris.addFriend(friend: kevin)
      paris.addFriend(friend: martha)
      paris.addFriend(friend: patrick)

      portugal.addFriend(friend: amy)
      portugal.addFriend(friend: nancy)
      portugal.addFriend(friend: martha)
      portugal.addFriend(friend: kevin)

      ireland.addFriend(friend: mike)
      ireland.addFriend(friend: joann)
      ireland.addFriend(friend: patrick)
      ireland.addFriend(friend: martha)
      ireland.addFriend(friend: kevin)

      // swiftlint:disable line_length
      dinosaurBurgers = Transaction(currency: Currency.EUR.rawValue, amount: 15.75, payer: fred, trip: nightOutInBedrock, desc: "Dinosaur Burgers")
      // swiftlint:enable line_length

      friedClams = Transaction(
        currency: Currency.EUR.rawValue,
        amount: 21.00,
        payer: betty,
        trip: anotherNightOut,
        desc: "Fried clams"
      )
      context.insert(dinosaurBurgers)
      context.insert(friedClams)

      // Paris transactions
      // swiftlint:disable line_length
      rerB = Transaction(currency: "EUR", amount: 27.90, payer: kevin, trip: paris, desc: "RER B back to the airport")
      sainteChapelle = Transaction(currency: "EUR", amount: 26.00, payer: martha, trip: paris, desc: "Admission to Sainte-Chapelle")
      arcDeTriompe = Transaction(currency: "EUR", amount: 18.00, payer: kevin, trip: paris, desc: "Admission to the arc de triomphe")
      taxi = Transaction(currency: "EUR", amount: 62.00, payer: kevin, trip: paris, desc: "Taxi from airport")
      fiveGuys = Transaction(currency: "EUR", amount: 46.12, payer: patrick, trip: paris, desc: "Lunch")
      novotel = Transaction(currency: "EUR", amount: 278.73, payer: kevin, trip: paris, desc: "Hotel")
      dinner = Transaction(currency: "EUR", amount: 167.75, payer: martha, trip: paris, desc: "Dinner")
      // swiftlint:enable line_length

      context.insert(rerB)
      context.insert(sainteChapelle)
      context.insert(arcDeTriompe)
      context.insert(taxi)
      context.insert(fiveGuys)
      context.insert(novotel)
      context.insert(dinner)

      // FIXME should I add more transactions here?
      paris.addTransaction(transaction: rerB)

      return container
    } catch {
      fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
    }
  }()
}
