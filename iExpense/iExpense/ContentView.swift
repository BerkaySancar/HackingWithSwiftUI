//
//  ContentView.swift
//  iExpense
//
//  Created by Berkay Sancar on 29.11.2022.
//

import SwiftUI

class Expenses: ObservableObject {
    
    @Published var items = [ExpenseItem]()
}

struct HomeView: View {
    
    @StateObject var expenses = Expenses()
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeObject)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 10 )
                    expenses.items.append(expense)
                } label: {
                     Image(systemName: "plus")
                }
            }
        }
    }
    
    private func removeObject(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
