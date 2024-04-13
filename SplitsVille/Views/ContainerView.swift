//
//  ContainerView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 13/04/2024.
//

import SwiftUI

struct ContainerView: View {
  @State private var isSplashScreenViewPresented = true
  var body: some View {
    if !isSplashScreenViewPresented {
      ContentView()
    } else {
      SplashScreenView(isPresented: $isSplashScreenViewPresented)
    }
  }
}

#Preview {
  ContainerView()
}
