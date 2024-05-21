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
            .font(.title2)
          HStack {
            Text("\(item.instructions)")
              .font(.callout)
              .multilineTextAlignment(.leading)
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
  let screen1Instructions = """
  To use SplitsVille:

  1. Add yourself and some friends on the friends tab
  2. Add a trip on the Trips tab
  3. Add friends to the tip on the trip's detail page
  4. Add transactions on the transactions tab
  
  """
  let onboardingItem = OnboardingItem(
    systemImageName: "dollarsign",
    title: Constants.Application.applicationName,
    subtitle: "A simple but powerful way to track shared expenses while traveling",
    instructions: screen1Instructions
  )

  return OnboardingScreen(item: onboardingItem)
}
