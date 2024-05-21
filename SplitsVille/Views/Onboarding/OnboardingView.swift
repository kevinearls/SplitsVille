//
//  OnboardingView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 15/04/2024.
//

import SwiftUI

struct OnboardingView: View {
  @State private var selectedView = 1
  let maxNumberOfScreens = 2
  var screen1Instructions = """
  To use SplitsVille:

  1. Add yourself and some friends on the friends tab
  2. Add a trip on the Trips tab
  3. Add friends to the trip on the trip's detail page
  4. Add transactions on the transactions tab
  """

  var screen2Instructions = """
  At the end of your trip, go to the balances tabs
  to see what everyone owes.
  """
  @AppStorage(Constants.Onboarding.currentOnboardingVersion)
    private var hasSeenOnboardingView = false
  var body: some View {
    VStack {
      TabView(selection: $selectedView) {
        OnboardingScreen(item: OnboardingItem(
          systemImageName: "dollarsign",
          title: "Welcome to \(Constants.Application.applicationName)",
          subtitle: "Share expenses with friends",
          instructions: screen1Instructions)
        )
        .tag(1)
        OnboardingScreen(item: OnboardingItem(
          systemImageName: "eurosign",
          title: "Simple conversion",
          subtitle: "Performs currency conversion",
          instructions: screen2Instructions))
        .tag(2)
      }
      .tabViewStyle(.page)
      .indexViewStyle(.page(backgroundDisplayMode: .always))

      Button(selectedView == maxNumberOfScreens ? "Done" : "Next") {
        if selectedView == maxNumberOfScreens {
          hasSeenOnboardingView = true  // Save the completedOnboarding state and exit the view
        } else {
          selectedView += 1
        }
      }
      .buttonStyle(.borderedProminent)
      .padding(.vertical)
    }
  }
}

#Preview {
  OnboardingView()
}
