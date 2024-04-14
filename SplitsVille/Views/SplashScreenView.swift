//
//  SplashScreenView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 13/04/2024.
//
// Based on: https://www.youtube.com/watch?v=lBCpwYDljwI&t=7s

import SwiftUI

struct SplashScreenView: View {
  @Binding var isPresented: Bool
  @State private var systemImageOpacity = 0.2
  @State private var systemImageSize = 50.0
  @State private var scale = CGSize(width: 0.8, height: 0.8)
  @State private var zStackOpacity = 1.0
  @State var isDollarSignSpinning = true

  var body: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      ZStack {
        Image(systemName: "dollarsign")    // TODO pick one randomly from a known set?
          .foregroundStyle(.white)
          .font(.system(size: systemImageSize))   // TODO create a constant
          .opacity(systemImageOpacity)
          .rotationEffect(.degrees(isDollarSignSpinning ? 360 : 0))
      }
      .scaleEffect(scale)
      .onAppear {
        withAnimation(.easeIn(duration: 3)) {
          isDollarSignSpinning.toggle()
        }
      }
    }
    .opacity(zStackOpacity)
    .onAppear {
      withAnimation(.easeIn(duration: 2.5)) {
        systemImageOpacity = 1.0
        systemImageSize = 150
      }

      Task {
        try await Task.sleep(for: .seconds(3))
        withAnimation(.easeIn(duration: 0.35)) {
          zStackOpacity = 0.0
        }
        try await Task.sleep(for: .seconds(1))
        withAnimation(.easeIn(duration: 0.2)) {
          isPresented.toggle()
        }
      }
    }
  }
}

#Preview {
  SplashScreenView(isPresented: .constant(true))
}
