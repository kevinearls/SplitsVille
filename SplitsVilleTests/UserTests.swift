//
//  UserTests.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
@testable import SplitsVille

final class UserTests: XCTestCase {
  func testExample() throws {
    let fred = User(firstName: "Fred", lastName: "Flintstone")
    XCTAssertEqual("Fred", fred.firstName)
    XCTAssertEqual("Flintstone", fred.lastName)
    XCTAssertEqual("FF", fred.initials)
    XCTAssertNotNil(fred.avatarColor)
  }
}
