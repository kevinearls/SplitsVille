//
//  TestData.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 27/04/2024.
//

import Foundation
@testable import SplitsVille

enum TestData {
  static let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: Currency.EUR.rawValue)
  static let wilma = Friend(firstName: "Wilma", lastName: "Flintstone", currency: Currency.EUR.rawValue)
  static let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: Currency.GBP.rawValue)
  static let betty = Friend(firstName: "Betty", lastName: "Rubble", currency: Currency.GBP.rawValue)
  static let trip1 = Trip(name: "Big Night Out", location: "Bedrock")
}
