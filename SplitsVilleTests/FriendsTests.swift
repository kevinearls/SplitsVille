//
//  FriendsTests.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
import SwiftData
@testable import SplitsVille

final class FriendsTests: XCTestCase {
  private var context: ModelContext!
  
  @MainActor
  override func setUp() {
    context = mockContainer.mainContext
  }
  
  func testSimple() throws {
    let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")
    XCTAssertEqual("Fred", fred.firstName)
    XCTAssertEqual("Flintstone", fred.lastName)
    XCTAssertEqual("FF", fred.initials)
    XCTAssertNotNil(fred.avatarColor)
    XCTAssertEqual(fred.currency, Constants.Currency.EUR.rawValue)
  }
}
