//
//  TripTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
@testable import SplitsVille

final class TripTest: XCTestCase {
  func testSimple() throws {
    let trip = Trip(name: "Street Art", location: "Lisbon")
    XCTAssertNotNil(trip)
    XCTAssertEqual("Street Art", trip.name)
    XCTAssertEqual("Lisbon", trip.location)
  }
}
