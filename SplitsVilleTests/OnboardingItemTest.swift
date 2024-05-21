//
//  OnboardingItemTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 15/04/2024.
//

import XCTest
@testable import SplitsVille

final class OnboardingItemTest: XCTestCase {
  func testOnboardingItem() throws {
    let item = OnboardingItem(systemImageName: "dollarsign", title: "title", subtitle: "sub", instructions: "Do this")
    XCTAssertEqual("dollarsign", item.systemImageName)
    XCTAssertEqual("title", item.title)
    XCTAssertEqual("sub", item.subtitle)
    XCTAssertEqual("Do this", item.instructions)
  }
}
