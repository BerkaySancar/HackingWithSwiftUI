//
//  MainViewModel.swift
//  iExpense
//
//  Created by Berkay Sancar on 29.11.2022.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var items = [ExpenseItem]() {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    private func saveItems() {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(self.items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    private func getItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                self.items = decodedItems
            }
        }
    }
    
    func removeObject(at offsets: IndexSet) {
        self.items.remove(atOffsets: offsets)
    }
}
