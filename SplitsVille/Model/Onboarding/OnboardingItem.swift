//
//  OnboardingItem.swift
//  SplitsVille
//
//  Created by Kevin Earls on 15/04/2024.
//

import Foundation

struct OnboardingItem: Identifiable {
  let id = UUID()
  let systemImageName: String
  let title: String
  let subtitle: String
  let instructions: String
}
