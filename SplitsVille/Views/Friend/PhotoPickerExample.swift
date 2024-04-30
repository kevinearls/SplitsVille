//
//  PhotoPickerExample.swift
//  SplitsVille
//
//  Created by Kevin Earls on 30/04/2024.
//

import SwiftUI
import PhotosUI

struct PhotoPickerExample: View {
  @State private var avatarItem: PhotosPickerItem?
  @State private var avatarImage: Image?
  @State private var imagedDataSize = 0

  var body: some View {
    VStack {
      PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
      Divider()
      avatarImage?
        .resizable()
        .scaledToFit()
        .frame(width: 300, height: 300)
      Divider()
      Text("Count: \(imagedDataSize)")
    }
    .onChange(of: avatarItem) {
      Task {
        if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
          avatarImage = loaded
        } else {
          print("Failed")
        }

        if let ddd = try? await avatarItem?.loadTransferable(type: Data.self) {
          print("Got a \(ddd.count)")
          imagedDataSize = ddd.count
        } else {
          imagedDataSize = -999
        }
      }
    }
  }
}

#Preview {
  PhotoPickerExample()
}
