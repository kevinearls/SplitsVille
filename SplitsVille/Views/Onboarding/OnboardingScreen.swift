//
//  OnboardingScreen.swift
//  SplitsVille
//
//  Created by Kevin Earls on 15/04/2024.
//

import SwiftUI

struct OnboardingScreen: View {
  let item: OnboardingItem

  var body: some View {
    ScrollView {
      VStack {
        Spacer()
        Image(systemName: item.systemImageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 200, maxHeight: 200)
          .padding(.bottom)

        VStack(alignment: .center) {
          Text(item.title)
            .bold()
            .font(.title)
            .padding(.bottom)

          Text(item.subtitle)
            .padding(.bottom)
        }
      }
      .padding()
    }
  }
}

#Preview {
  let onboardingItem = OnboardingItem(
    systemImageName: "dollarsign",
    title: Constants.Application.applicationName,
    subtitle: "A simple but powerful way to track shared expenses while traveling"
    )

  return OnboardingScreen(item: onboardingItem)
}
