//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex Jackson on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Alex", "Lee"]
    @State private var selectedStudent = "Alex"

    var body: some View {
        NavigationStack {

            Form {
                Picker("Select name", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Name", text: $name)
                Text("Hello, \(name)")
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)

            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }

        }
    }
}

#Preview {
    ContentView()
}
