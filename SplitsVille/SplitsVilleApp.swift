//
//  SplitsVilleApp.swift
//  SplitsVille
//
//  Created by Kevin Earls on 11/04/2024.
//

import SwiftUI
import SwiftData

@main
struct SplitsVilleApp: App {
  @AppStorage(Constants.Onboarding.currentOnboardingVersion)
  private var hasSeenOnboardingView = false
  var body: some Scene {
    WindowGroup {
      if hasSeenOnboardingView {
        ContentView()
          .modelContainer(for: [Friend.self, Trip.self])
      } else {
        OnboardingView()
      }
    }
  }
}
