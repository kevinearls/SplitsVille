//
//  TransactionsTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 28/04/2024.
//

import XCTest
import SwiftData
@testable import SplitsVille

final class TransactionsTest: XCTestCase {
  // swiftlint:disable:next implicitly_unwrapped_optional
  var context: ModelContext!

  @MainActor
  override func setUpWithError() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
    context = container.mainContext
  }

  func testSimple() throws {
    context.insert(TestData.kevin)
    context.insert(TestData.patrick)
    context.insert(TestData.paris)

    // swiftlint:disable:next line_length
    let transaction = Transaction(currency: "EUR", amount: 11.74, payer: TestData.patrick, trip: TestData.paris, desc: "Dinner")
    context.insert(transaction)

    XCTAssertNotNil(transaction)
    XCTAssertEqual(Currency.EUR.rawValue, transaction.currency)
    XCTAssertEqual(transaction.trip, TestData.paris)
    XCTAssertEqual(transaction.paidBy, TestData.patrick)
    XCTAssertEqual(transaction.desc, "Dinner")
    print("\(transaction.debugDescription)")
  }
}
