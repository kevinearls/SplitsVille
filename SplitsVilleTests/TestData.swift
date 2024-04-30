//
//  TestData.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 27/04/2024.
//

import Foundation
@testable import SplitsVille

enum TestData {
// swiftlint:disable line_length
  static let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: Currency.EUR.rawValue, imageData: Data())
  static let wilma = Friend(firstName: "Wilma", lastName: "Flintstone", currency: Currency.EUR.rawValue, imageData: Data())
  static let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: Currency.GBP.rawValue, imageData: Data())
  static let betty = Friend(firstName: "Betty", lastName: "Rubble", currency: Currency.GBP.rawValue, imageData: Data())
  static let trip1 = Trip(name: "Big Night Out", location: "Bedrock")
  // swiftlint:enable line_length
}
