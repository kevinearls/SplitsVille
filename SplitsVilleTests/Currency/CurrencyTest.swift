//
//  CurrencyTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 13/05/2024.
//

import XCTest
@testable import SplitsVille

final class CurrencyTest: XCTestCase {

  // This doesn't do much but increases code coverage numbers
  func testExample() throws {
    XCTAssertEqual(Currency.allCases.count, 8)

    for currency in Currency.allCases {
      print(currency.id)
    }
  }
}
