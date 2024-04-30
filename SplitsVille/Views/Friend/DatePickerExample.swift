//
//  DatePickerExample.swift
//  SplitsVille
//
//  Created by Kevin Earls on 30/04/2024.
//

import SwiftUI

struct DatePickerExample: View {
  let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  @State private var birthDate = Date.now

  var body: some View {
    VStack {
      DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
        Text("Select a date")
      }
      Divider()
      Text("Date is \(birthDate, formatter: dateFormatter)")
    }
  }
}

#Preview {
  DatePickerExample()
}
