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

  static let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
  static let martha = Friend(firstName: "Martha", lastName: "Hill", currency: "EUR", imageData: Data())
  static let amy = Friend(firstName: "Amy", lastName: "Costa", currency: "USD", imageData: Data())
  static let nancy = Friend(firstName: "Nancy", lastName: "Peterson", currency: "GBP", imageData: Data())
  static let patrick = Friend(firstName: "Patrick", lastName: "Riordan", currency: "USD", imageData: Data())
  static let mike = Friend(firstName: "Mike", lastName: "Craven", currency: "USD", imageData: Data())
  static let joann = Friend(firstName: "JoAnn", lastName: "Bianchi", currency: "EUR", imageData: Data())
  static let michelle = Friend(firstName: "Michelle", lastName: "Dubois", currency: "USD", imageData: Data())
  static let paul = Friend(firstName: "Paul", lastName: "Bauer", currency: "EUR", imageData: Data())

  static let paris = Trip(name: "Patrick's Paris Adventure", location: "Paris")  // TODO add dates
  static let portugal = Trip(name: "Street Art", location: "Portugal")
  static let ireland = Trip(name: "Family Visit", location: "Ireland")

  // TODO do we need to add trips and friends to the container first?
  // swiftlint:disable line_length
  static let rerB = Transaction(currency: "EUR", amount: 27.90, payer: kevin, trip: paris, desc: "RER B back to the airport")
  static let sainteChapelle = Transaction(currency: "EUR", amount: 26.00, payer: martha, trip: paris, desc: "Admission to Sainte-Chapelle")
  static let arcDeTriompe = Transaction(currency: "EUR", amount: 18.00, payer: kevin, trip: paris, desc: "Admission to the arc de triomphe")
  // swiftlint:enable line_length
  static let taxi = Transaction(currency: "EUR", amount: 62.00, payer: kevin, trip: paris, desc: "Taxi from airport")
  static let fiveGuys = Transaction(currency: "EUR", amount: 46.12, payer: patrick, trip: paris, desc: "Lunch")
  static let novotel = Transaction(currency: "EUR", amount: 278.73, payer: kevin, trip: paris, desc: "Hotel")
  static let dinner = Transaction(currency: "EUR", amount: 167.75, payer: martha, trip: paris, desc: "Dinner")
}
