//
//  SplitsVilleApp.swift
//  SplitsVille
//
//  Created by Kevin Earls on 11/04/2024.
//

import SwiftUI

@main
struct SplitsVilleApp: App {
  @AppStorage(Constants.Onboarding.currentOnboardingVersion)
  private var hasSeenOnboardingView = false
  var body: some Scene {
    WindowGroup {
      if hasSeenOnboardingView {
        ContentView()
          .environmentObject(FriendStore())
      } else {
        OnboardingView()
      }
    }
  }
}
