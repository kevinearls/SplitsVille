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

//  enum AvatarColor {
//    static let blue = "blueAvatar"
//    static let brown = "brownAvatar"
//    static let cyan = "cyanAvatar"
//    static let gray = "grayAvatar"
//    static let green = "greenAvatar"
//    static let indigo = "indigoAvatar"
//    static let mint = "mintAvatar"
//    static let orange = "orangeAvatar"
//    static let pink = "pinkAvatar"
//    static let purple = "purpleAvatar"
//    static let red = "redAvatar"
//    static let yellow = "yellowAvatar"
//    static let teal = "tealAvatar"
//  }

  enum InitialsAvatar {
    static let frameHeight: CGFloat = 85.0
    static let frameWidth: CGFloat = 85.0
    static let initialsSize: CGFloat = frameHeight * 0.6
  }

  enum ButtonNames {
    static let addFriendButton = "addFriendButton"
  }

  public static let currencyFreaksBaseURL = "https://api.currencyfreaks.com/v2.0/rates/latest/"
}
