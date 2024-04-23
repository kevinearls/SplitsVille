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
  func testSimple() throws {
    let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")
    XCTAssertEqual("Fred", fred.firstName)
    XCTAssertEqual("Flintstone", fred.lastName)
    XCTAssertEqual("FF", fred.initials)
    XCTAssertNotNil(fred.avatarColor)
    XCTAssertEqual(fred.currency, Currency.EUR.rawValue)
  }
}
