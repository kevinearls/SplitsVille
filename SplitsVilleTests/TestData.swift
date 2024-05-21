//
//  TestData.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 27/04/2024.
//

import Foundation
@testable import SplitsVille

enum TestData {
  static let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
  static let martha = Friend(firstName: "Martha", lastName: "Hill", currency: "EUR", imageData: Data())
  static let amy = Friend(firstName: "Amy", lastName: "Costa", currency: "USD", imageData: Data())
  static let nancy = Friend(firstName: "Nancy", lastName: "Peterson", currency: "GBP", imageData: Data())
  static let patrick = Friend(firstName: "Patrick", lastName: "Riordan", currency: "USD", imageData: Data())

  static let paris = Trip(name: "Patrick's Paris Adventure", location: "Paris")  // TODO add dates
  static let portugal = Trip(name: "Street Art", location: "Portugal")

  // TODO do we need to add trips and friends to the container first?
  // swiftlint:disable line_length
  static let sainteChapelle = Transaction(currency: "EUR", amount: 26.00, payer: martha, trip: paris, desc: "Admission to Sainte-Chapelle")
  // swiftlint:enable line_length
  static let taxi = Transaction(currency: "EUR", amount: 62.00, payer: kevin, trip: paris, desc: "Taxi from airport")
  static let fiveGuys = Transaction(currency: "EUR", amount: 46.12, payer: patrick, trip: paris, desc: "Lunch")
}
