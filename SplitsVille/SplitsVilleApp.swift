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
      // FIXME - should we show splash screen before onboarding?
      if hasSeenOnboardingView {
        ContainerView()
      } else {
        OnboardingView()
      }
    }
  }
}
