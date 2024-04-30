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
  @MainActor
  func testSimple() throws {
    let fred = TestData.fred

    XCTAssertEqual("Fred", fred.firstName)
    XCTAssertEqual("Flintstone", fred.lastName)
    XCTAssertEqual(fred.currency, Currency.EUR.rawValue)
  }

  // FIXME move these tests to more appropriate places.  Neither really does
  // much other than increase coverage numbers
  @MainActor
  func testPreviewController() throws {
    let container = PreviewController.previewContainer
    XCTAssertEqual(1, container.configurations.count)
  }

  func testCurrency() throws {
    let euros = Currency.EUR
    XCTAssertEqual("EUR", euros.rawValue)
  }
}
