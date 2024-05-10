//
//  OnboardingScreen.swift
//  SplitsVille
//
//  Created by Kevin Earls on 15/04/2024.
//

import SwiftUI

struct OnboardingScreen: View {
  let item: OnboardingItem
  @State var isDollarSignSpinning = true

  var body: some View {
    ScrollView {
      VStack {
        Spacer()
        Image(systemName: item.systemImageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 200, maxHeight: 200)
          .padding(.bottom)
          .rotationEffect(.degrees(isDollarSignSpinning ? 360 : 0))

        VStack(alignment: .center) {
          Text(item.title)
            .bold()
            .font(.title)
            .padding(.bottom)

          Text(item.subtitle)
            .padding(.bottom)
          HStack {
            Text(item.instructions)
              .multilineTextAlignment(.leading)
            Spacer()
          }
        }
      }
      .padding()
      .onAppear {
        withAnimation(.easeIn(duration: 2)) {
          isDollarSignSpinning.toggle()
        }
      }
    }
  }
}

#Preview("Light, Portrait") {
  let multilineInstructions = """
  This is the first line
  And this is the second line
  Finally this is the third line
  """
  let onboardingItem = OnboardingItem(
    systemImageName: "dollarsign",
    title: Constants.Application.applicationName,
    subtitle: "A simple but powerful way to track shared expenses while traveling",
    instructions: multilineInstructions
  )

  return OnboardingScreen(item: onboardingItem)
}
