//
//  Constants.swift
//  SplitsVille
//
//  Created by Kevin Earls on 15/04/2024.
//

import Foundation

enum Constants {
  enum Onboarding {
    static let currentOnboardingVersion = "onboardingVersion_1.0.0"
  }

  enum Application {
    static let applicationName = "$plitsvill€"
  }

  enum AvatarColor {
    static let blue = "blueAvatar"
    static let brown = "brownAvatar"
    static let cyan = "cyanAvatar"
    static let gray = "grayAvatar"
    static let green = "greenAvatar"
    static let indigo = "indigoAvatar"
    static let mint = "mintAvatar"
    static let orange = "orangeAvatar"
    static let pink = "pinkAvatar"
    static let purple = "purpleAvatar"
    static let red = "redAvatar"
    static let yellow = "yellowAvatar"
    static let teal = "tealAvatar"
  }

  enum Currency: String, CaseIterable, Identifiable {
    case USD // US Dollars
    case EUR // Euros
    case GBP // Great British Pounds
    case CHF // Swiss Francs
    case CAD // Canadian Dollars
    case JPY // Japanese Yes
    case MXN // Mexican Peso
    case INR // Indian rupees

    var id: Self { self }
  }
}
