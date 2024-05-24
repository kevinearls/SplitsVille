//
//  BalancesTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 10/05/2024.
//

import XCTest
import SwiftData
@testable import SplitsVille

enum TestError: Error {
  case error
}

final class BalancesTest: XCTestCase {
  let mike = Friend(firstName: "Mike", lastName: "Craven", currency: "USD", imageData: Data())
  let joann = Friend(firstName: "JoAnn", lastName: "Bianchi", currency: "EUR", imageData: Data())
  let michelle = Friend(firstName: "Michelle", lastName: "Dubois", currency: "USD", imageData: Data())
  let paul = Friend(firstName: "Paul", lastName: "Bauer", currency: "EUR", imageData: Data())

  // swiftlint:disable:next implicitly_unwrapped_optional
  var context: ModelContext!

  let rates = [
    "CHF": "0.909835",
    "JPY": "153.0640314133071",
    "MXN": "16.979733333333332",
    "EUR": "0.9319709990078193",
    "GBP": "0.7974587918635101",
    "CAD": "1.3666883333333333",
    "INR": "83.41031742883256"
  ]

  // swiftlint:disable:next implicitly_unwrapped_optional
  var exchangeRates: ExchangeRates!

  @MainActor
  override func setUpWithError() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
    context = container.mainContext
    exchangeRates = ExchangeRates(date: "2024-05-03 00:00:00+00", base: "USD", rates: rates)
  }

  func testBalanceEntryTest() throws {
    let entry = OwedBy(friend: mike, currency: .EUR, amount: 11.17)
    XCTAssertNotNil(entry)
    XCTAssertEqual(entry.friend, mike)
    XCTAssertEqual(entry.currency, Currency.EUR)
    XCTAssertEqual(entry.amount, 11.17)
  }

  func testBalanceTest() throws {
    let balance = Balance(principal: paul, trip: TestData.portugal)
    XCTAssertNotNil(balance)
    XCTAssertEqual(balance.principal, paul)
    XCTAssertEqual(0, balance.entries.count)

//    let entry1 = OwedBy(friend: mike, currency: .USD, amount: 11.17)
//    let entry2 = OwedBy(friend: paul, currency: .EUR, amount: 9.47)
//    balance.addBalanceEntry(friend: mike, currency: .USD, amount: 11.17)
//    balance.addBalanceEntry(entry2)
//
//    XCTAssertEqual(2, balance.entries.count)
//    XCTAssertTrue(balance.entries.contains { $0 == entry1 })
//    XCTAssertTrue(balance.entries.contains { $0 == entry2 })
  }

  @MainActor
  func testBalancesGetter() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
    context = container.mainContext

    let paris = Trip(name: "Patrick's Paris Adventure", location: "Paris")
    context.insert(paris)

    let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
    let martha = Friend(firstName: "Martha", lastName: "Hill", currency: "EUR", imageData: Data())
    let patrick = Friend(firstName: "Patrick", lastName: "Riordan", currency: "USD", imageData: Data())

    context.insert(kevin)
    context.insert(patrick)
    context.insert(martha)
    paris.addFriend(friend: kevin)
    paris.addFriend(friend: patrick)
    paris.addFriend(friend: martha)

    // swiftlint:disable:next line_length
    let sainteChapelle = Transaction(currency: "EUR", amount: 26.00, payer: martha, trip: paris, desc: "Admission to Sainte-Chapelle")

    let taxi = Transaction(currency: "EUR", amount: 62.00, payer: kevin, trip: paris, desc: "Taxi from airport")
    let fiveGuys = Transaction(currency: "EUR", amount: 46.12, payer: patrick, trip: paris, desc: "Lunch")

    context.insert(fiveGuys)
    context.insert(taxi)
    context.insert(sainteChapelle)

    paris.addTransaction(transaction: fiveGuys)
    paris.addTransaction(transaction: taxi)
    paris.addTransaction(transaction: sainteChapelle)
  }

  @MainActor
  func testBalanceComputation() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
    context = container.mainContext

    let paris = Trip(name: "Patrick's Paris Adventure", location: "Paris")
    context.insert(paris)

    let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
    let martha = Friend(firstName: "Martha", lastName: "Hill", currency: "EUR", imageData: Data())
    let patrick = Friend(firstName: "Patrick", lastName: "Riordan", currency: "USD", imageData: Data())

    context.insert(kevin)
    context.insert(patrick)
    context.insert(martha)
    paris.addFriend(friend: kevin)
    paris.addFriend(friend: patrick)
    paris.addFriend(friend: martha)

    // swiftlint:disable:next line_length
    let sainteChapelle = Transaction(currency: "EUR", amount: 26.00, payer: martha, trip: paris, desc: "Admission to Sainte-Chapelle")

    let taxi = Transaction(currency: "EUR", amount: 62.00, payer: kevin, trip: paris, desc: "Taxi from airport")
    let fiveGuys = Transaction(currency: "EUR", amount: 46.12, payer: patrick, trip: paris, desc: "Lunch")

    context.insert(fiveGuys)
    context.insert(taxi)
    context.insert(sainteChapelle)
    paris.addTransaction(transaction: fiveGuys)
    paris.addTransaction(transaction: taxi)
    paris.addTransaction(transaction: sainteChapelle)

    // swiftlint:disable:next line_length
    let grid = BalanceCalculator().calculateBalances(trip: paris, transactions: [fiveGuys, taxi, sainteChapelle], rates: exchangeRates)
    XCTAssertNotNil(grid)
    XCTAssertEqual(grid.count, 3)
    XCTAssertNotNil(grid[kevin])
    XCTAssertNotNil(grid[patrick])
    XCTAssertNotNil(grid[martha])
    XCTAssertEqual(grid[kevin]?.entries.count, 2)
    XCTAssertEqual(grid[patrick]?.entries.count, 2)
    XCTAssertEqual(grid[martha]?.entries.count, 2)

    guard let kevinsEntries = grid[kevin]?.entries else {
      throw TestError.error
    }
    XCTAssertEqual(kevinsEntries.count, 2)
    for entry in kevinsEntries {
      if entry.friend == martha {
        XCTAssertEqual(entry.amount, 8.66, accuracy: 0.1)
      } else if entry.friend == patrick {
        XCTAssertEqual(entry.amount, 16.49, accuracy: 0.1)
      }
    }
  }
}
