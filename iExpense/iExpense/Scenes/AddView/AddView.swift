//
//  AddView.swift
//  iExpense
//
//  Created by Berkay Sancar on 29.11.2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    
    private let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: self.amount)
                    viewModel.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(viewModel: MainViewModel())
    }
}
