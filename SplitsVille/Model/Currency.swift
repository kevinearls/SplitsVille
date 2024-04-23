//
//  Currency.swift
//  SplitsVille
//
//  Created by Kevin Earls on 23/04/2024.
//

import Foundation

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
