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

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testExample() throws {
    context.insert(TestData.barney)  // TODO do in setup()?
    context.insert(TestData.trip1)

//    let transaction = Transaction(currency: "EUR", payer: TestData.barney, desc: "Dinner")
//
//    XCTAssertNotNil(transaction)
//    XCTAssertEqual(Currency.EUR.rawValue, transaction.currency)
//    //XCTAssertEqual(transaction.trip, TestData.trip1)
//    XCTAssertEqual(transaction.paidBy, TestData.barney)
//    XCTAssertEqual(transaction.desc, "Dinner")
  }
}
