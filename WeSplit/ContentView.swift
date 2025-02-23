//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex Jackson on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var totalAmounts: (perPerson: Double, grandTotal: Double) {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = billAmount / 100 * tipSelection
        let grandTotal = billAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson, grandTotal)
    }
    
    var body: some View {
        NavigationStack {

            Form {
                // Bill amount / number of people
                Section {
                    TextField(
                        "Amount", value: $billAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "GBP")
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                // Tip amount
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                // Total per person
                Section("Amount per person") {
                    Text(
                        totalAmounts.perPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "GBP"))
                }
                // Total per person
                Section("Total") {
                    Text(
                        totalAmounts.grandTotal,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "GBP"))
                }

            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
