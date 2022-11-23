//
//  ContentView.swift
//  WeSplit
//
//  Created by Berkay Sancar on 23.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 0
    @State private var tipPercentage: Int = 0
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    var amountPerPerson: Double {
        let numberOfPeople = Double(2 + numberOfPeople)
        let total = checkAmount + (checkAmount * Double(tipPercentage) / 100)
        return total / numberOfPeople
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("Amount & Number of people")
                }
                
                Section {
                    Picker("Tip percentages", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tıp do you want to leave?")
                }
                
                Section {
                    Text(amountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
